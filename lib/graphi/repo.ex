defmodule Graphi.Repo do
  use Ecto.Repo,
    otp_app: :graphi,
    adapter: Ecto.Adapters.Postgres
end
