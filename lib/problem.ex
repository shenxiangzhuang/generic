defmodule Problem do
  @moduledoc """
  Genetic problem modudle(behaviour)
  """

  alias Types.Chromosome

  @callback genotype() :: Chromosome.t()
  @callback fitness_function(Chromosome.t()) :: number()
  @callback terminate?(Enum.t()) :: boolean()
end
