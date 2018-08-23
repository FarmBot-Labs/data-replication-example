defmodule Client.Asset.Sequence do
  @moduledoc """
  Executable asset. Fields ommited for clarity.
  """
  use Ecto.Schema

  schema "sequences" do
    field :name, :string
    belongs_to :device, Client.Asset.Device
    has_many :regimen_items, Client.Asset.RegimenItem
  end
end
