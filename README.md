# README

This is a simple application somewhat recreating the HTTP/RESTful relationship
between
[The FarmBot Web App](https://github.com/farmbot/Farmbot-Web-App) (Rails) and
[FarmBot OS](https://github.com/farmbot/farmbot_os). (Elixir/Nerves)

## Quick overview
The FarmBot Web app has resources stored in an SQL database.
This is represented by the `server` Elixir Application. It server static JSON
fixtures modeled just like what the real app would serve.

FarmBotOS consumes the resources stored in the SQL database as served by HTTP.
This is represented by the `client` Elixir application.

## Objective
Get the data served by the web app (`server`) into FarmBotOS's (`client`)
local cache while maintaining relationships between documents.

## Notes
* Authorization is omitted for clarity.
* FarmBotOS (`client`) does not always have a stable Internet connection.
  * Synchronization should happen all at once, not lazily.
* Documents are stored in the Database differently than how they are presented.
  * `client` schemas mirror the `server`'s hidden ActiveRecord models.
* Fields/columns can be added to `server`, but may not be removed or changed.
* `Device` is the central/root resource.
* Putting all assets on the `devices/:id` endpoint is not a valid solution
for bandwidth/size reasons .
* This might not be solvable while meeting all constraints?

## Usage

* clone this repository.
* open a new terminal and change directory into `server`.
  * `mix deps.get`
  * `iex -S mix`
* open a new terminal and change directory into `client`.
  * `mix deps.get`
  * `mix ecto.migrate`
  * `iex -S mix`
