defmodule ProjectsTest do
  use ExUnit.Case

  test "get_multiple_projects/1 works as expected" do
    {result, %{"data" => [project | _rest]}} = Asana.Projects.get_multiple_projects()
    assert project["gid"] != nil
    assert project["name"] != nil
    assert project["resource_type"] == "project"
    assert result == :ok
  end

  test "get_workspace_projects/1 works as expected" do
    {:ok, %{"data" => [workspace | _tail]}}  = Asana.Workspaces.get_multiple_workspaces()
    {result, _data} = Asana.Projects.get_workspace_projects(workspace["gid"])
    assert workspace["resource_type"] == "workspace"
    assert result == :ok
  end
end
