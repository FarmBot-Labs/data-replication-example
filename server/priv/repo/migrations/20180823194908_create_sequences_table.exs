defmodule Server.Repo.Migrations.CreateSequencesTable do
  use Ecto.Migration

  def change do
    create table("sequences") do
      add :name, :string
      add :device_id, references("devices")
    end
  end
end
