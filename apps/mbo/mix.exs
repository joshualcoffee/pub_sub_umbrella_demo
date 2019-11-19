defmodule MBO.MixProject do
  use Mix.Project

  def project do
    [
      app: :mbo,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MBO.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:broadway_cloud_pub_sub, "~> 0.5.0"},
      {:goth, "~> 1.0"},
      {:google_api_pub_sub, "~> 0.16"},
      {:kane, "~> 0.7.0"},
      {:jason, "~> 1.1"}
    ]
  end
end
