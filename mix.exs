defmodule ZaIdNumber.MixProject do
  use Mix.Project

  @source_url "https://github.com/fltoss/za_id_number"

  def project do
    [
      app: :za_id_number,
      version: "1.1.0",
      elixir: "~> 1.16",
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: @source_url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md", "LICENSE"]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Wilhelm H Kirschbaum"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"
      }
    ]
  end

  defp description do
    "Validates South African ID Numbers."
  end
end
