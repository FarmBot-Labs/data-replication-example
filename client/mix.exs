defmodule Client.MixProject do
  use Mix.Project

  def project do
    [
      app: :client,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Client.Application, []}
    ]
  end

  defp deps do
    [
      {:sqlite_ecto2, "~> 2.2"},
      {:jason, "~> 1.1"},
      {:tesla, "~> 1.0.0"}
    ]
  end
end
