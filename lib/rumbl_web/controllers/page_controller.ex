defmodule RumblWeb.PageController do
  use RumblWeb, :controller

  def home(conn, _params) do
    IO.inspect("============")
    IO.inspect(get_session(conn, :current_user))
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def asma(conn, params) do
    name = Map.get(params, "name", "Asma")
    render(conn, :asma, layout: false, name: name)
  end
end
