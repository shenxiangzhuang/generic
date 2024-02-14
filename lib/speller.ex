defmodule Speller do
  @behaviour Problem
  alias Types.Chromosome

  @target "helloworld"
  @string_size String.length(@target)

  @impl Problem
  def genotype() do
    genes =
      Stream.repeatedly(fn -> Enum.random(?a..?z) end)
      |> Enum.take(@string_size)

    %Chromosome{
      genes: genes,
      size: @string_size
    }
  end

  @impl Problem
  def fitness_function(chromosome) do
    guess = List.to_string(chromosome.genes)
    String.jaro_distance(@target, guess)
  end

  @impl Problem
  def terminate?([best | _]) do
    best.fitness >= 0.99
  end
end
