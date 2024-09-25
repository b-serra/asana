defmodule Asana.Utils do
  def get_base_url, do: "https://app.asana.com/api/1.0"

  def get_access_key, do: Application.fetch_env!(:asana, :access_key)
end
