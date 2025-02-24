defmodule Graphi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GraphiWeb.Telemetry,
      Graphi.Repo,
      {DNSCluster, query: Application.get_env(:graphi, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Graphi.PubSub},
      # Start a worker by calling: Graphi.Worker.start_link(arg)
      # {Graphi.Worker, arg},
      # Start to serve requests, typically the last entry
      GraphiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Graphi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
