defmodule SlackBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :slack_bot,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:slack, "~> 0.19.0"}
    ]
  end
end
