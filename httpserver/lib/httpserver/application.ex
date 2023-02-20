defmodule Httpserver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Httpserver.Worker.start_link(arg)
      # {Httpserver.Worker, arg}
      # Add webserver code
      # Plug.Conn  as soon as conn, Plug.Router <-- Routes
      {Plug.Cowboy, scheme: :http, plug: Httpserver.HelloWorldPlug, options: [port: 8000]},
      {Plug.Cowboy, scheme: :http, plug: Httpserver.Router, options: [port: 7000]}
    ]

    Logger.info("Running the web servers...")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Httpserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
