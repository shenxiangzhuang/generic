defmodule Geneticx.MixProject do
  use Mix.Project

  @version "0.1.1"
  @description "Generic Algorithms for fun"

  def project do
    [
      app: :geneticx,
      version: @version,
      elixir: "~> 1.15",
      name: "Generticx",
      description: @description,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
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
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      # The main page in the docs
      main: "readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/shenxiangzhuang/geneticx",
      extras: ["README.md", "CHANGELOG.md", "LICENSE"]
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
