use Mix.Config

config :client, [
  ecto_repos: [Client.Repo],
  port: 4000
]

config :client, Client.Repo, [
  adapter: Sqlite.Ecto2,
  database: "client.db"
]
