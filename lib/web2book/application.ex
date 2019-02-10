defmodule Web2book.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Web2book.Repo,
      # Start the endpoint when the application starts
      Web2bookWeb.Endpoint
      # Starts a worker by calling: Web2book.Worker.start_link(arg)
      # {Web2book.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Web2book.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Web2bookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
