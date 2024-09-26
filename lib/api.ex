defmodule Asana.Api do
  use Tesla
  require Logger

  alias Asana.Utils

  plug Tesla.Middleware.BaseUrl, Utils.get_base_url()
  plug Tesla.Middleware.BearerAuth, token: Utils.get_access_key()
  plug Tesla.Middleware.PathParams
  plug Tesla.Middleware.JSON

  def request(:get, url, params) do
    url
    |> merge_query_params(params)
    |> get(opts: [path_params: params])
    |> manage_request()
  end

  defp manage_request(req) do
    with {:ok, %Tesla.Env{status: 200, body: body}} <- req do
      {:ok, body}
    else
      error ->
        manage_error(error)
    end
  end

  defp manage_error({:ok, %Tesla.Env{body: msg, status: code}}) do
    msg
    |> inspect()
    |> then(& "Response status: #{code} -> #{&1}")
    |> Logger.error()

    {:error, msg}
  end

  defp manage_error({:error, msg} = error) do
    msg
    |> inspect()
    |> Logger.error()

    error
  end

  def merge_query_params(url, []), do: url

  def merge_query_params(url, params) do
    params
    |> Enum.reduce(url <> "?", fn {key, val}, acc -> acc <> "#{key}=#{val}&" end)
    |> String.trim_trailing("&")
  end
end
