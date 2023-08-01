defmodule RumblWeb.AuthController do
  use RumblWeb, :controller
  alias Rumbl.Users
  alias Rumbl.User

  def form(conn, params) do
    changeset = Users.change_user(%User{})
    render(conn, "form.html", changeset: changeset)
  end

  def login(conn, %{"user" => user_params}) do
    case Users.login(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> put_flash(:info, "#{user.name} login successfully.")
        |> redirect(to: "/")

      {:error, :username_and_password_does_not_match} ->
        conn
        |> put_flash(:error, ":username_and_password_does_not_match")
        |> redirect(to: "/login")

      {:error, :user_not_found} ->
        conn
        |> put_flash(:error, ":user_not_found")
        |> redirect(to: "/login")
    end
  end
end

## session
