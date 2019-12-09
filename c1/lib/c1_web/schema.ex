defmodule C1Web.Schema do
  use Absinthe.Schema

  object :dot_position do
    field :x, :float
    field :y, :float
  end

  query do
    field :dot_position, :dot_position do
      resolve(fn _parent, _args, _resolution ->
        {:ok, C1.DotPosition.value()}
      end)
    end
  end

  mutation do
    field :update_dot_position, :dot_position do
      arg(:x, non_null(:float))
      arg(:y, non_null(:float))

      resolve(fn _parent, position, _resolution ->
        C1.DotPosition.set(position)

        {:ok, position}
      end)
    end
  end

  subscription do
    field :position_updated, :dot_position do
      config(fn _args, _resolution ->
        {:ok, topic: "*"}
      end)
    end
  end
end
