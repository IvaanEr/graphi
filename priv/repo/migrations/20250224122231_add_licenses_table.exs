defmodule Graphi.Repo.Migrations.AddLicensesTable do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE license_types AS ENUM('with_salary', 'without_salary');"

    create table(:licenses) do
      add :position_id, :bigint, null: false
      add :starts_at, :utc_datetime, null: false
      add :ends_at, :utc_datetime
      add :type, :license_types
      add :reason, :string
      timestamps()
    end
  end
end
