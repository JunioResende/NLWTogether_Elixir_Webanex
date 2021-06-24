defmodule Webanex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Webanex.Repo,
      # Start the Telemetry supervisor
      WebanexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Webanex.PubSub},
      # Start the Endpoint (http/https)
      WebanexWeb.Endpoint
      # Start a worker by calling: Webanex.Worker.start_link(arg)
      # {Webanex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Webanex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WebanexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
