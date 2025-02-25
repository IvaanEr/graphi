{ pkgs, ... }:

{
  # Specify the development environment name
  packages = with pkgs; [
    elixir
    erlang_27
    nodejs_20  # Optional, useful for Phoenix projects
    postgresql_17
  ];

  languages.elixir.enable = true;

  services.postgres = {
    enable = true;
    package = pkgs.postgresql_17;
    listen_addresses = "127.0.0.1";
    createDatabase = false;
    # Configure the database if needed
    initialScript = ''
      CREATE USER postgres SUPERUSER;
    '';
  };

  enterShell = ''
    echo "Welcome to your Elixir and Postgres 17 development environment!"
    export DATABASE_URL="postgres://dev:dev@localhost:5432/dev"
  '';

  dotenv.enable = true;  # If you want to load .env files automatically

  scripts.setup_app.exec = ''
    mix deps.get
    mix ecto.create
    mix ecto.migrate
    mix run priv/repo/seeds.exs
  '';

  scripts.migrate.exec = "mix ecto.migrate"; # Example command
}
