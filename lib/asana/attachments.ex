defmodule Asana.Attachments do
  alias Asana.Api

  def get_attachment(attachment_gid, params \\ []) do
    url = "/attachments/:attachment_gid"
    params = Keyword.merge([attachment_gid: attachment_gid], params)
    Api.request(:get, url, params)
  end

  def get_attachments_from_object(obj_gid, params \\ []) do
    url = "/attachments"
    params = Keyword.merge([parent: obj_gid], params)
    Api.request(:get, url, params)
  end
end
