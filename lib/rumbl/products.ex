defmodule Rumbl.Products do
  alias Rumbl.Repo
  alias Rumbl.Product
  import Ecto.Query
  # alias allows you to set up aliases for any given module name
  # CRUDL actions - create, read, update, delete, list
  # def all
  # def find
  # def create
  # def update

  # params = %{"search" => "An"}
  def list_products(params \\ %{}) do
    # key is search #params is a map
    query =
      if params["search"] do
        term = "%#{params["search"]}%"

        from(p in Product,
          where: ilike(p.name, ^term) or ilike(p.type, ^term) or ilike(p.color, ^term)
        )
      else
        from p in Product, order_by: [asc: p.id]
      end

    Repo.all(query)
  end

  def get_product(id) do
    Repo.get(Product, id)
  end

  def get_product_by(params) do
    # Enum.find(list_users(), fn user ->
    #   Enum.all?(params, fn {key, value} -> Map.get(user, key) == value end)
    # end)
    Repo.get_by(Product, params)
  end

  def change_product(%Product{} = product) do
    # %User{}
    Product.changeset(product, %{})
  end

  def create_product(attrs \\ %{}) do
    # %User{}
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(product) do
    Repo.delete(product)
  end
end
