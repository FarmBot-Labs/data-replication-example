defmodule Client.Repo.Migrations.CreateDevicesTable do
  use Ecto.Migration

  def change do
    create table("devices") do
      add :name, :string
    end
  end
end
