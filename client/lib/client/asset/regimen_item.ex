defmodule Client.Asset.RegimenItem do
  @moduledoc "Time offset for when a sequence should be executed."
  use Ecto.Schema

  schema "regimens" do
    field :time_offset, :integer
    belongs_to :regimen, Client.Asset.Regimen
    belongs_to :sequence, Client.Asset.Sequence
  end
end
