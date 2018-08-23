defmodule Client.Asset.Regimen do
  @moduledoc """
  List of events to happen in the future.
  """

  use Ecto.Schema

  schema "regimens" do
    field :name, :string
    field :in_use, :boolean
    belongs_to :device, Client.Asset.Device
    has_many :regimen_items, Client.Asset.RegimenItem
  end
end
