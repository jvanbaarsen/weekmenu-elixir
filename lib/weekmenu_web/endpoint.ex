defmodule WeekmenuWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :weekmenu
  use Absinthe.Phoenix.Endpoint
  use Appsignal.Phoenix

  socket "/socket", WeekmenuWeb.UserSocket,
    websocket: [timeout: 45_000],
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :weekmenu,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt absinthe_graphiql)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_weekmenu_key",
    signing_salt: "8MLenZ+D"

  plug WeekmenuWeb.Router
end
