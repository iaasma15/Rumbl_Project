defmodule Rumbl.Users do
  alias Rumbl.Repo
  alias Rumbl.User
  import Ecto.Query
  # alias allows you to set up aliases for any given module name
  # CRUDL actions - create, read, update, delete, list
  # def all
  # def find
  # def create
  # def update

  # params = %{"search" => "An"}
  def list_users(params \\ %{}) do
    # key is search #params is a map
    query =
      if params["search"] do
        term = "%#{params["search"]}%"

        from(u in User,
          where: ilike(u.name, ^term) or ilike(u.username, ^term) or ilike(u.address, ^term)
        )
      else
        from u in User, order_by: [asc: u.id]
      end

    Repo.all(query)
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

  def register(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def login(attrs) do
    case Repo.get_by(User, username: attrs["username"]) do
      %User{} = user ->
        if password_match?(user, attrs["password"]) do
          {:ok, user}
        else
          {:error, :username_and_password_does_not_match}
        end

      nil ->
        {:error, :user_not_found}
    end
  end

  def password_match?(user, password) do
    password == user.password
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
