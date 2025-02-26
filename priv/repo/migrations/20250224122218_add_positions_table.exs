defmodule Graphi.Repo.Migrations.AddPositionsTable do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE categories AS ENUM('temporario', 'reemplazante', 'interino', 'ordinario');"

    create table(:positions) do
      add :position_code_id, :bigint, null: false
      add :teacher_id, :bigint, null: false
      add :category, :categories
      add :school, :string
      add :department, :string
      add :starts_at, :utc_datetime, null: false
      add :ends_at, :utc_datetime
      timestamps()
    end
  end

  def down do
    execute "DROP TYPE categories;"
    drop table(:positions)
  end
end
