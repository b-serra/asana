defmodule Asana.TasksTest do
    use ExUnit.Case

    test "get_multiple_tasks/1 needs some params to work" do
      {error, _msg} = Asana.Tasks.get_multiple_tasks()
      assert error == :error
    end

    test "get_multiple_tasks/1 works well" do
      {:ok, %{"data" => [project | _rest]}} = Asana.Projects.get_multiple_projects()
      {result, %{"data" => [task | _rest]}} = Asana.Tasks.get_multiple_tasks(project: project["gid"])
      assert task["gid"] != nil
      assert task["name"] != nil
      assert task["resource_type"] == "task"
      assert result == :ok
    end
end
