defmodule Demo.Mixfile do
  use Mix.Project

  def project do
    [app: :demo,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: [:logger, :kitto, :httpoison]]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:kitto, "0.5.1"},
     {:httpoison, "~> 0.9", override: true},
     {:poison, "3.0.0", override: true},
     {:oauth, github: "tim/erlang-oauth"},
     {:extwitter, "~> 0.7"}]
  end
end
