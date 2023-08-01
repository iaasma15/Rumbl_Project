defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Users
  alias Rumbl.User

  plug :authenticate

  def index(conn, params) do
    users = Users.list_users(params)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created successfully.")
        |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    case Users.get_user(id) do
      %User{} = user ->
        changeset = User.changeset(user, %{})
        render(conn, "edit.html", user: user, changeset: changeset)

      nil ->
        conn
        |> put_flash(:error, "User not found.")
        |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :index))
    end
  end

  def update(conn, %{"user" => user_params, "id" => id}) do
    case Users.get_user(id) do
      %User{} = user ->
        case Users.update_user(user, user_params) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "#{user.name} updated successfully.")
            |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :show, user))

          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "edit.html", user: user, changeset: changeset)
        end

      nil ->
        conn
        |> put_flash(:error, "User not found.")
        |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    with %User{} = user <- Users.get_user(id),
         {:ok, user} <- Users.delete_user(user) do
      conn
      |> put_flash(:info, "#{user.name} deleted successfully.")
      |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :index))
    else
      nil ->
        conn
        |> put_flash(:error, "User not found.")
        |> redirect(to: RumblWeb.Router.Helpers.user_path(conn, :index))
    end
  end

  defp authenticate(conn, _opts) do
    case get_session(conn, :current_user) do
      %User{} ->
        conn

      nil ->
        conn
        |> put_session(:request_path, conn.request_path)
        |> put_flash(:error, "Please log in")
        |> redirect(to: "/login")
        |> halt()
    end
  end
end
