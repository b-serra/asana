defmodule Asana.CustomFields do
  alias Asana.Api

  def get_workspace_custom_fields(workspace_gid, params \\ [limit: 10]) do
    url = "/workspaces/:workspace_gid/custom_fields"
    params = Keyword.merge([workspace_gid: workspace_gid], params)
    Api.request(:get, url, params)
  end
end
