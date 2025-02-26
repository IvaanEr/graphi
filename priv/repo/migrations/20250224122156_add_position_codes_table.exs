defmodule Graphi.Repo.Migrations.AddPositionCodesTable do
  use Ecto.Migration

  def change do
    create table(:position_codes) do
      add :code, :string, null: false
      add :abbreviation, :string
      add :description, :string
      add :hours, :integer
      timestamps()
    end
  end
end
