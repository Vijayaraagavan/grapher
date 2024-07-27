defmodule Grapher.Telemetry do
  def emit(event, value, meta \\ %{}) do
    :telemetry.execute(event, value,  meta)
  end
end
