defmodule Asana.Workspaces do
  alias Asana.Api

  def get_multiple_workspaces(params \\ [limit: 10]) do
    url = "/workspaces"
    Api.request(:get, url, params)
  end
end
