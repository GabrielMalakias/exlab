defmodule SortingHat do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(SortingHat.Repo, []),

      supervisor(SortingHat.Endpoint, []),

      # Start your own worker by calling: SortingHat.Worker.start_link(arg1, arg2, arg3)
      # worker(SortingHat.Worker, [arg1, arg2, arg3]),
    ]

    opts = [strategy: :one_for_one, name: SortingHat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    SortingHat.Endpoint.config_change(changed, removed)
    :ok
  end
end
