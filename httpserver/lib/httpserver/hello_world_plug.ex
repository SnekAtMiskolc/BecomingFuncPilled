defmodule Httpserver.HelloWorldPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    cl = put_resp_content_type(conn, "text/plain")
    send_resp(cl, 200, "Hello World!\n")
  end
end
