defmodule Client.Asset.Device do
  @moduledoc """
  Central resource representing the identity of a client.
  """
  use Ecto.Schema

  schema "device" do
    field :name, :string
    has_many :sequences, Client.Asset.Sequence
    has_many :regimens, Client.Asset.Regimen
  end
end
