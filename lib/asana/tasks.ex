defmodule Asana.Tasks do
  alias Asana.Api

  def get_task(task_gid, params \\ []) do
    url = "/tasks/:task_gid"
    params = Keyword.merge([task_gid: task_gid], params)
    Api.request(:get, url, params)
  end

  def get_multiple_tasks(params \\ []) do
    url = "/tasks"
    Api.request(:get, url, params)
  end

  def get_tasks_from_project(project_gid, params \\ []) do
    url = "/projects/:project_gid/tasks?limit=:limit"
    params = Keyword.merge([project_gid: project_gid], params)
    Api.request(:get, url, params)
  end
end
