[
  import_deps: [:ecto, :ecto_sql, :phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{ex,exs}",
    "priv/*/seeds.exs",
    "{priv,tools,lib,test}/**/*.{ex,exs}",
    "vendor/*/{config,lib,test}/**/*.{ex,exs}",
    "config/*.exs",
    "mix.exs",
    ".formatter.exs"
  ]
]
