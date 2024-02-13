defmodule Geneticx do
  @moduledoc """
  Documentation for `Geneticx`.
  """
  alias Types.Chromosome

  @population_size 200

  @doc """
  Run the genetic algorithm
  """
  def run(problem, opts \\ []) do
    population = initialize(&problem.genotype/0)

    population
    |> evolve(problem, opts)
  end

  @doc """
  The core algorithm
  """
  def evolve(population, problem, opts \\ []) do
    population = evaluate(population, &problem.fitness_function/1, opts)
    best = hd(population)
    IO.write("\r[#{DateTime.utc_now()}]Current Best: #{best.fitness}")

    if problem.terminate?(population) do
      best
    else
      population
      |> select(opts)
      |> crossover(opts)
      |> mutation(opts)
      |> evolve(problem, opts)
    end
  end

  @doc """
  Initialize the population with genotype
  """
  def initialize(genotype, opts \\ []) do
    population_size = Keyword.get(opts, :population_size, @population_size)
    for _ <- 1..population_size, do: genotype.()
  end

  @doc """
  Evaluate the population with the fitness function
  """
  def evaluate(population, fitness_function, _opts \\ []) do
    population
    |> Enum.map(fn chromosome ->
      fitness = fitness_function.(chromosome)
      age = chromosome.age + 1
      %Chromosome{chromosome | fitness: fitness, age: age}
    end)
    |> Enum.sort_by(& &1.fitness, :desc)
  end

  @doc """
  Select the parents for the next generation
  """
  def select(population, _opts \\ []) do
    population
    |> Enum.chunk_every(2)
    |> Enum.map(&List.to_tuple(&1))
  end

  @doc """
  Crossover to generate the children
  """
  def crossover(population, _opts \\ []) do
    population
    |> Enum.reduce(
      [],
      fn {p1, p2}, acc ->
        cx_point = :rand.uniform(length(p1.genes))
        {h1, t1} = Enum.split(p1.genes, cx_point)
        {h2, t2} = Enum.split(p2.genes, cx_point)
        {c1, c2} = {%Chromosome{p1 | genes: h1 ++ t2}, %Chromosome{p2 | genes: h2 ++ t1}}
        [c1, c2 | acc]
      end
    )
  end

  @doc """
  Mutate the children randomly
  """
  def mutation(population, _opts \\ []) do
    population
    |> Enum.map(fn chromosome ->
      if :rand.uniform() < 0.05 do
        %Chromosome{chromosome | genes: Enum.shuffle(chromosome.genes)}
      else
        chromosome
      end
    end)
  end
end
