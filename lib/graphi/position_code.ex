defmodule Graphi.PositionCode do
  use Ecto.Schema

  import Ecto.Changeset

  schema "position_codes" do
    field(:code, :string)
    field(:abbreviation, :string)
    field(:description, :string)
    field(:hours, :integer)
    timestamps()
  end

  def changeset(position_code, attrs) do
    position_code
    |> cast(attrs, [:code, :abbreviation, :description, :hours])
    |> validate_required([:code])
  end
end
