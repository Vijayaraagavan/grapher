defmodule Grapher.Collector do

  def start_link(_) do
    attach()
  end
  def attach do
    :telemetry.attach("graph-request-handler", [:graph, :request], &__MODULE__.handle_graph_event/4, nil)
  end

  def handle_graph_event(event, value, _, _) do
    IO.inspect(event, label: "received event")
    IO.inspect(value, label: "received value")
    # IO.inspect("logging => #{List.to_string(event)} - #{value |> Map.to_list() |> List.to_string()}")
  end
end
# Grapher.Collector.attach
# Grapher.Telemetry.emit([:graph, :request], %{name: "vijay"})
