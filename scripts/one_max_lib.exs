fitness_function = fn chromosome -> Enum.sum(chromosome) end
genotype = fn -> for  _ <- 1..1000, do: Enum.random(0..1) end
max_fitness = 1000


solution = Generic.run(fitness_function, genotype, max_fitness)
IO.puts("\n[#{DateTime.utc_now()}]Answer:")
IO.inspect(solution)
