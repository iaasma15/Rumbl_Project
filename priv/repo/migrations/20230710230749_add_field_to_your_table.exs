defmodule Rumbl.Repo.Migrations.AddFieldToYourTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :address, :string
    end
  end
end