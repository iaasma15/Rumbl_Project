defmodule RumblWeb.AuthHTML do
  use RumblWeb, :html
  alias Rumbl.User
  alias Phoenix.HTML.Link
  import Phoenix.HTML.Form

  embed_templates "auth_html/*"

  def error_message(changeset) do
    changeset.errors
    |> Enum.map(fn {attr, {msg, _}} ->
      "#{attr} : #{msg}"
    end)
    |> Enum.join(". ")
  end
end
