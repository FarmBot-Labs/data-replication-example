defmodule Client.HTTP do
  @device_id 1
  @port 4000

  use Tesla
  plug Tesla.Middleware.BaseUrl, "http://localhost:#{@port}"
  plug Tesla.Middleware.Headers, []
  plug Tesla.Middleware.JSON


  def device do
    get!("/api/devices/#{@device_id}")
    |> Map.fetch!(:body)
  end

  def sequences do
    get!("/api/sequences")
    |> Map.fetch!(:body)
  end

  def regimens do
    get!("/api/regimens")
    |> Map.fetch!(:body)
  end
end
