defmodule Rumbl.Users do
  alias Rumbl.Repo
  alias Rumbl.User
  # alias allows you to set up aliases for any given module name
  # CRUDL actions - create, read, update, delete, list
  # def all
  # def find
  # def create
  # def update

  def list_users do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user_by(params) do
    # Enum.find(list_users(), fn user ->
    #   Enum.all?(params, fn {key, value} -> Map.get(user, key) == value end)
    # end)
    Repo.get_by(User, params)
  end

  def change_user(%User{} = user) do
    # %User{}
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    # %User{}
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(user) do
    Repo.delete(user)
  end
end
