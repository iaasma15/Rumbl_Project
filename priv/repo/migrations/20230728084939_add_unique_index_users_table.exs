defmodule Rumbl.Repo.Migrations.AddUniqueIndexUsersTable do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:name])
    create unique_index(:users, [:username])
  end
end
