defmodule Server.Router do
  use Plug.Router


  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/api/devices/:id" do
    fixture(conn, "devices", id)
  end

  get "/api/regimens" do
    fixture(conn, "regimens")
  end

  get "/api/regimens/:id" do
    fixture(conn, "regimens", id)
  end

  get "/api/sequences" do
    fixture(conn, "sequences")
  end

  get "/api/sequences/:id" do
    fixture(conn, "sequences", id)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp fixture(conn, dir, id) do
    case File.read("fixture/#{dir}/#{id}.json") do
      {:ok, json} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, json |> Jason.decode!() |> Jason.encode!())
      {:error, :enoent} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(%{"error" => "not found"}))
    end
  end

  defp fixture(conn, dir) do
    if File.dir?("fixture/#{dir}") do
      Enum.map(File.ls!("fixture/#{dir}"), fn(filename) ->
        File.read!("fixture/#{dir}/#{filename}") |> Jason.decode!()
      end)
      |> Jason.encode!()
      |> fn(r) ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, r)
      end.()
    else
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(404, Jason.encode!(%{"error" => "not found"}))
    end

  end
end
