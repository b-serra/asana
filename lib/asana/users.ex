defmodule Asana.Users do
  alias Asana.Api

  def get_user(user_gid, params \\ []) do
    url = "/users/:user_gid"
    params = Keyword.merge([user_gid: user_gid], params)
    Api.request(:get, url, params)
  end

  def get_multiple_users(params \\ [limit: 10]) do
    url = "/users"
    Api.request(:get, url, params)
  end

  def get_workspace_users(workspace_gid, params \\ [limit: 10]) do
    url = "/workspaces/:workspace_gid/users"
    params = Keyword.merge([workspace_gid: workspace_gid], params)
    Api.request(:get, url, params)
  end
end
