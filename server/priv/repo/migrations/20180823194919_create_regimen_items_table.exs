defmodule Server.Repo.Migrations.CreateRegimenItemsTable do
  use Ecto.Migration

  def change do
    create table("regimen_items") do
      add :time_offset, :integer
      add :regimen_id, references("regimens")
      add :sequence_id, references("sequences")
    end
  end
end
