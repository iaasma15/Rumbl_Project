defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :address, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :address])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 3, max: 20)
  end
end
