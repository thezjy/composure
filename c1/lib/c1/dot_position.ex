defmodule C1.DotPosition do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{x: 0.0, y: 0.0} end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def set(position) do
    Agent.update(__MODULE__, fn _ -> position end)
    Absinthe.Subscription.publish(C1Web.Endpoint, position, position_updated: "*")
  end
end
