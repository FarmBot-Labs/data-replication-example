defmodule Server.Application do
  @moduledoc false

  use Application
  @port Application.get_env(:server, :port)

  def start(_type, _args) do
    children = [
      {Plug.Adapters.Cowboy2, [
          scheme: :http,
          plug: Server.Router,
          options: [port: @port]
        ]
      }
    ]

    opts = [strategy: :one_for_one, name: Server.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
