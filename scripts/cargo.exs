defmodule Cargo do
  alias Types.Chromosome
  @behaviour Problem

  @size 10
  @profits [6, 5, 8, 9, 6, 7, 3, 1, 2, 6]
  @target 53

  @impl Problem
  def genotype() do
    genes = for _ <- 1..@size, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: @size}
  end

  @impl Problem
  def fitness_function(chromosome) do
    chromosome.genes
    |> Enum.zip(@profits)
    |> Enum.map(fn {p, g}  -> p * g end)
    |> Enum.sum()
  end

  @impl Problem
  def terminate?(population) do
    Enum.max_by(population, &Cargo.fitness_function/1).fitness == @target
  end
end


Geneticx.run(Cargo)
