defmodule OneMax do
  @moduledoc """
  OneMax Problem
  """
  alias Types.Chromosome
  @behaviour Problem

  @string_size 42

  @doc """
  Genotype of onemax problem
  """
  @impl Problem
  def genotype() do
    genes = for _ <- 1..@string_size, do: Enum.random(0..1)

    %Chromosome{
      genes: genes,
      size: @string_size
    }
  end

  @doc """
  Fitness function for onemax problem
  """
  @impl Problem
  def fitness_function(chromosome) do
    Enum.sum(chromosome.genes)
  end

  @doc """
  Maximum Fitness Threshold(Currently)

      @impl Problem
      def terminate?([best | _]) do
        best.fitness == @string_size
      end

  Minimum Fitness Threshold(Optional)

      @impl Problem
      def terminate?([_ | worest]) do
        worest.fitness == 0
      end

  Average Fitness Threshold(Optional)

      @impl Problem
      def terminate?(population) do
        avg =
          population
          |> Enum.map(&Enum.sum(&1) / length(&1))
        avg == div(@string_size, 2)
      end

  """
  @impl Problem
  def terminate?([best | _]) do
    best.fitness == @string_size
  end
end
