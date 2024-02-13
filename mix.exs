defmodule Geneticx.MixProject do
  use Mix.Project

  def project do
    [
      app: :geneticx,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),

      name: "Genetic algorithms",
      source_url: "https://github.com/shenxiangzhuang/geneticx",
      homepage_url: "https://github.com/shenxiangzhuang/geneticx",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      main: "Geneticx", # The main page in the docs
      extras: ["README.md"]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Xiangzhuang Shen"],
      links: %{"GitHub" => "https://github.com/shenxiangzhuang/geneticx"}
    }
  end
end
