defmodule Asana.Projects do
  alias Asana.Api

  def get_project(project_gid, params \\ []) do
    url = "/projects/:project_gid"
    params = Keyword.merge([project_gid: project_gid], params)
    Api.request(:get, url, params)
  end

  def get_multiple_projects(params \\ []) do
    url = "/projects"
    Api.request(:get, url, params)
  end

  def get_workspace_projects(workspace_gid, params \\ []) do
    url = "/workspaces/:workspace_gid/projects"
    params = Keyword.merge([workspace_gid: workspace_gid], params)
    Api.request(:get, url, params)
  end
end
