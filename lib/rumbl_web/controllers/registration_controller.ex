defmodule RumblWeb.RegistrationController do
  use RumblWeb, :controller
  alias Rumbl.Users
  alias Rumbl.User

  def form(conn, params) do
    changeset = Users.change_user(%User{})
    render(conn, "form.html", changeset: changeset)
  end

  def register(conn, %{"user" => user_params}) do
    case Users.register(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} registered successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "form.html", changeset: changeset)
    end
  end
end
