defmodule Types.Chromosome do
  @moduledoc """
  Chromosome struct(the solution and other infomation related to the problem)
  """

  @type t :: %__MODULE__{
          genes: Enum.t(),
          size: number(),
          fitness: number(),
          age: number()
        }

  @enforce_keys :genes
  defstruct [:genes, size: 0, fitness: 0, age: 0]
end
