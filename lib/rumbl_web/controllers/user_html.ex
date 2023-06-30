defmodule RumblWeb.UserHTML do
  use RumblWeb, :html
  alias Rumbl.User
  alias Phoenix.HTML.Link
  import Phoenix.HTML.Form

  embed_templates "user_html/*"

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def link_to_user(%User{id: id}) do
    # path = RumblWeb.Router.Helpers.user_path(conn, :create)
    Link.link("Show", to: "/users/#{id}")
  end

  def error_message(changeset) do
    changeset.errors
    |> Enum.map(fn {attr, {msg, _}} ->
      "#{attr} : #{msg}"
    end)
    |> Enum.join(". ")
  end
end
