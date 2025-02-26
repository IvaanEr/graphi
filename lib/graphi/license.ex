defmodule Graphi.License do
  use Ecto.Schema

  import Ecto.Changeset

  schema "licenses" do
    field(:position_id, :integer)
    field(:starts_at, :utc_datetime)
    field(:ends_at, :utc_datetime)
    field(:type, :string)
    field(:reason, :string)
    timestamps()
  end

  def changeset(license, attrs) do
    license
    |> cast(attrs, [
      :position_id,
      :starts_at,
      :ends_at,
      :type,
      :reason
    ])
    |> validate_required([:position_id, :starts_at])
    |> validate_inclusion(:type, Graphi.Consts.license_types())
  end
end
