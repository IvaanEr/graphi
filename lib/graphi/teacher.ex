defmodule Graphi.Teacher do
  use Ecto.Schema

  import Ecto.Changeset

  schema "teachers" do
    field(:file_id, :string)
    field(:last_name, :string)
    field(:first_name, :string)
    field(:grade_title, :string)
    field(:posgrade_title, :string)
    field(:observations, :string)
    timestamps()
  end

  def changeset(teacher, attrs) do
    teacher
    |> cast(attrs, [
      :file_id,
      :last_name,
      :first_name,
      :grade_title,
      :posgrade_title,
      :observations
    ])
    |> validate_required([:file_id, :last_name, :first_name])
  end
end
