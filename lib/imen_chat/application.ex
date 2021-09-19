defmodule ImenChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ImenChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ImenChat.PubSub},
      # Start the Endpoint (http/https)
      ImenChatWeb.Endpoint
      # Start a worker by calling: ImenChat.Worker.start_link(arg)
      # {ImenChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ImenChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ImenChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
