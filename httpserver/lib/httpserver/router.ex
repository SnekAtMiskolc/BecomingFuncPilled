defmodule Httpserver.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    # Get to localhost:8000
    send_resp(conn, 200, "Welcome to my API")
  end

  match _ do
    send_resp(conn, 404, "There is no route for that call")
  end
end
