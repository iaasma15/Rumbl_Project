defmodule Rumbl.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table("products") do
      add :name, :string
      add :type, :string
      add :quantity, :int
      add :unit, :string
      add :color, :string

      timestamps()
    end
  end
end
