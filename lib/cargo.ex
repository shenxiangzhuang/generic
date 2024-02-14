defmodule Cargo do
  alias Types.Chromosome
  @behaviour Problem

  @size 10
  @profits [6, 5, 8, 9, 6, 7, 3, 1, 2, 6]
  @weights [10, 6, 8, 7, 10, 9, 7, 11, 6, 8]
  @weight_limit 40
  @target 35

  @impl Problem
  def genotype() do
    genes = for _ <- 1..@size, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: @size}
  end

  @impl Problem
  def fitness_function(chromosome) do
    profit =
      chromosome.genes
      |> Enum.zip(@profits)
      |> Enum.map(fn {p, g} -> p * g end)
      |> Enum.sum()

    over_weight? =
      chromosome
      |> calculate_weight()
      |> Kernel.>=(@weight_limit)

    case over_weight? do
      false -> profit
      true -> 0
    end
  end

  @impl Problem
  def terminate?(population) do
    Enum.max_by(population, &Cargo.fitness_function/1).fitness == @target
  end

  def calculate_weight(chromosome) do
    chromosome.genes
    |> Enum.zip(@weights)
    |> Enum.map(fn {c, g} -> c * g end)
    |> Enum.sum()
  end
end
