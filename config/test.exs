use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :racelist, Racelist.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :racelist, Racelist.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "racelist_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "selenium", browser: "chrome"

config :racelist, sql_sandbox: true
