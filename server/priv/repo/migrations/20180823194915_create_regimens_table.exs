defmodule Server.Repo.Migrations.CreateRegimensTable do
  use Ecto.Migration

  def change do
    create table("regimens") do
      add :name, :string
      add :in_use, :boolean
      add :device_id, references("devices")
    end
  end
end
