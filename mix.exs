defmodule AshJsonApi.MixProject do
  use Mix.Project

  @description """
  A JSON API front end for the `Ash` resource framework
  """

  @version "1.0.0-rc.0"

  def project do
    [
      app: :ash_json_api,
      version: @version,
      elixir: "~> 1.11",
      description: @description,
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      consolidate_protocols: Mix.env() == :prod,
      docs: docs(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.github": :test
      ],
      dialyzer: [
        plt_add_apps: [:ex_unit, :open_api_spex]
      ],
      deps: deps(),
      docs: docs(),
      aliases: aliases(),
      package: package(),
      source_url: "https://github.com/ash-project/ash_json_api",
      homepage_url: "https://github.com/ash-project/ash_json_api"
    ]
  end

  defp package do
    [
      name: :ash_json_api,
      licenses: ["MIT"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*
      CHANGELOG* documentation),
      links: %{
        GitHub: "https://github.com/ash-project/ash_json_api"
      }
    ]
  end

  defp docs do
    [
      main: "getting-started-with-json-api",
      source_ref: "v#{@version}",
      extras: [
        "documentation/tutorials/getting-started-with-json-api.md",
        "documentation/topics/relationships.md",
        "documentation/topics/open-api.md",
        "documentation/how_to/upgrade.md",
        "documentation/dsls/DSL:-AshJsonApi.Resource.md",
        "documentation/dsls/DSL:-AshJsonApi.Domain.md"
      ],
      groups_for_extras: [
        Tutorials: ~r'documentation/tutorials',
        "How To": ~r'documentation/how_to',
        Topics: ~r'documentation/topics',
        DSLs: ~r'documentation/dsls'
      ],
      before_closing_head_tag: fn type ->
        if type == :html do
          """
          <script>
            if (location.hostname === "hexdocs.pm") {
              var script = document.createElement("script");
              script.src = "https://plausible.io/js/script.js";
              script.setAttribute("defer", "defer")
              script.setAttribute("data-domain", "ashhexdocs")
              document.head.appendChild(script);
            }
          </script>
          """
        end
      end,
      groups_for_modules: [
        AshJsonApi: [
          AshJsonApi,
          AshJsonApi.Router,
          AshJsonApi.Resource,
          AshJsonApi.Domain
        ],
        Utilities: [
          AshJsonApi.OpenApi
        ],
        Introspection: [
          AshJsonApi.Resource.Info,
          AshJsonApi.Domain.Info,
          AshJsonApi.Resource.Route
        ],
        Errors: [
          ~r/AshJsonApi.Error.*/,
          AshJsonApi.ToJsonApiError
        ],
        Internals: ~r/.*/
      ],
      logo: "logos/small-logo.png"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test) do
    ["test/support/", "lib/"]
  end

  defp elixirc_paths(_env) do
    ["lib/"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ash, ash_version("~> 3.0.0-rc.0")},
      {:plug, "~> 1.11"},
      {:jason, "~> 1.1"},
      {:json_xema, "~> 0.4"},
      {:open_api_spex, "~> 3.16", optional: true},
      {:git_ops, "~> 2.4", only: [:dev, :test]},
      {:ex_doc, github: "elixir-lang/ex_doc", only: [:dev, :test], runtime: false},
      {:ex_check, "~> 0.12", only: [:dev, :test]},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:sobelow, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.13", only: [:dev, :test]}
    ]
  end

  defp ash_version(default_version) do
    case System.get_env("ASH_VERSION") do
      nil -> default_version
      "local" -> [path: "../ash"]
      "main" -> [git: "https://github.com/ash-project/ash.git"]
      version -> "~> #{version}"
    end
  end

  defp aliases do
    [
      sobelow: "sobelow --skip",
      credo: "credo --strict",
      docs: [
        "spark.cheat_sheets",
        "docs",
        "spark.replace_doc_links",
        "spark.cheat_sheets_in_search"
      ],
      "spark.formatter": "spark.formatter --extensions AshJsonApi.Resource,AshJsonApi.Domain",
      "spark.cheat_sheets_in_search":
        "spark.cheat_sheets_in_search --extensions AshJsonApi.Resource,AshJsonApi.Domain",
      "spark.cheat_sheets":
        "spark.cheat_sheets --extensions AshJsonApi.Resource,AshJsonApi.Domain"
    ]
  end
end
