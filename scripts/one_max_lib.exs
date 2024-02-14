defmodule OneMax do
  alias Types.Chromosome
  @behaviour Problem

  @string_size 42

  @impl Problem
  def genotype() do
    genes = for _ <- 1..@string_size, do: Enum.random(0..1)
    %Chromosome{
      genes: genes,
      size: @string_size
    }
  end

  @impl Problem
  def fitness_function(chromosome) do
    Enum.sum(chromosome.genes)
  end

  @impl Problem
  def terminate?([best | _]) do
    best.fitness == @string_size
  end

end


Geneticx.run(OneMax)
