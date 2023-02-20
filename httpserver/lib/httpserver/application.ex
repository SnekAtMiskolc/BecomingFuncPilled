defmodule Httpserver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Httpserver.Worker.start_link(arg)
      # {Httpserver.Worker, arg}
      # Add webserver code
      # Plug.Conn  as soon as conn, Plug.Router <-- Routes
      {Plug.Cowboy, scheme: :http, plug: Httpserver.HelloWorldPlug, options: [port: 8000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Httpserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
