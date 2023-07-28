defmodule Rumbl.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :type, :string
    field :quantity, :integer
    field :unit, :string
    field :color, :string

    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :type, :quantity, :unit, :color])
    |> validate_required([:name, :color, :quantity])
    |> validate_length(:name, min: 3, max: 20)
  end
end
