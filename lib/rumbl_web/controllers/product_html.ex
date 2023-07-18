defmodule RumblWeb.ProductHTML do
    use RumblWeb, :html
    alias Rumbl.Product
    alias Phoenix.HTML.Link
    import Phoenix.HTML.Form
  
    embed_templates "product_html/*"
  
    def first_name(%Product{name: name}) do
      name
      |> String.split(" ")
      |> Enum.at(0)
    end
  
  
    def link_to_product(%Product{id: id}) do
      # path = RumblWeb.Router.Helpers.user_path(conn, :create)
      Link.link("Show", to: "/products/#{id}")
    end
  
    def edit_product_link(%Product{id: id}) do
      # path = RumblWeb.Router.Helpers.user_path(conn, :create)
      Link.link("Edit", to: "/products/#{id}/edit")
    end
  
    def delete_product_link(product) do
      Link.link("Delete", to: "/products/#{product.id}", method: :delete)
    end
  
    def error_message(changeset) do
      changeset.errors
      |> Enum.map(fn {attr, {msg, _}} ->
        "#{attr} : #{msg}"
      end)
      |> Enum.join(". ")
    end
  
    def render("form.html", assigns) do
      
    end
  end
  