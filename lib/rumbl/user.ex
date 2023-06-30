defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  def changeset(user, attr) do
    user
    |> cast(attr, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 3, max: 20)
  end
end
