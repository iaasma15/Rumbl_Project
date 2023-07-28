defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :address, :string
    field :password, :string
    field :confirm_password, :string, virtual: true

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :address])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 3, max: 20)
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :confirm_password])
    |> validate_required([:name, :username, :password, :confirm_password])
    |> validate_length(:username, min: 3, max: 20)
    # TODO validate name and user name uniqueness
    |> validate_length(:password, min: 6)
    |> unique_constraint(:name)
    |> unique_constraint(:username)
    |> validate_password_or_confirm_password()
  end

  defp validate_password_or_confirm_password(changeset) do
    password = get_change(changeset, :password)
    confirm_password = get_change(changeset, :confirm_password)

    if password || confirm_password do
      if password != confirm_password do
        add_error(changeset, :confirm_password, "must match password")
      else
        changeset
      end
    else
      add_error(changeset, :password, "or confirm_password must be present")
    end
  end
end
