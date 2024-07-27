defmodule Grapher.TelemetrySup do
  use Supervisor

  def start_link(_) do
    # children = [
    #   %{id: :telprocess, start: {Grapher.Collector, :start_link, []}}
    # ]
    Grapher.Collector.start_link(nil)
    Supervisor.start_child(__MODULE__, [])
  end

  def init(_init_arg) do
    {:ok, nil}
  end
end
