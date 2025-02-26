defmodule Graphi.Repo.Migrations.AddTeachersTable do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :file_id, :string, null: false
      add :last_name, :string, null: false
      add :first_name, :string, null: false
      add :grade_title, :string
      add :posgrade_title, :string
      add :observations, :text
      timestamps()
    end
  end
end
