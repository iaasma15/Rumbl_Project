defmodule RumblWeb.ProductController do
    use RumblWeb, :controller
    alias Rumbl.Products
    alias Rumbl.Product
  
    def index(conn, params) do
      products = Products.list_products(params)
      render(conn, "index.html", products: products)
    end
  
    def show(conn, %{"id" => id}) do
      product = Products.get_product(id)
      render(conn, "show.html", product: product)
    end
  
    def new(conn, _params) do
      changeset = Products.change_product(%Product{})
      render(conn, "new.html", changeset: changeset)
    end
  
    def create(conn, %{"product" => product_params}) do
      case Products.create_product(product_params) do
        {:ok, product} ->
          conn
          |> put_flash(:info, "#{product.name} created successfully.")
          |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :show, product))
  
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
  
    def edit(conn, %{"id" => id}) do
      case Products.get_product(id) do
        %Product{} = product ->
          changeset = Product.changeset(product, %{})
          render(conn, "edit.html", product: product, changeset: changeset)
  
        nil ->
          conn
          |> put_flash(:error, "Product not found.")
          |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :index))
      end
    end
  
    def update(conn, %{"product" => product_params, "id" => id}) do
      case Products.get_product(id) do
        %Product{} = product ->
          case Products.update_product(product, product_params) do
            {:ok, product} ->
              conn
              |> put_flash(:info, "#{product.name} updated successfully.")
              |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :show, product))
  
            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "edit.html", product: product, changeset: changeset)
          end
  
        nil ->
          conn
          |> put_flash(:error, "Product not found.")
          |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :index))
      end
    end
  
    def delete(conn, %{"id" => id}) do
      with %Product{} = product <- Products.get_product(id),
           {:ok, product} <- Products.delete_product(product) do
        conn
        |> put_flash(:info, "#{product.name} deleted successfully.")
        |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :index))
      else
        nil ->
          conn
          |> put_flash(:error, "Product not found.")
          |> redirect(to: RumblWeb.Router.Helpers.product_path(conn, :index))
      end
    end
  end
  