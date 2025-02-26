defmodule Graphi.Position do
  use Ecto.Schema

  import Ecto.Changeset

  schema "positions" do
    field(:position_code_id, :integer)
    field(:teacher_id, :integer)
    field(:category, :string)
    field(:school, :string)
    field(:department, :string)
    field(:starts_at, :utc_datetime)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(position, attrs) do
    position
    |> cast(attrs, [
      :position_code_id,
      :teacher_id,
      :category,
      :school,
      :department,
      :starts_at,
      :ends_at
    ])
    |> validate_required([:position_code_id, :teacher_id, :starts_at])
    |> validate_inclusion(:category, Graphi.Consts.category_types())
  end
end
