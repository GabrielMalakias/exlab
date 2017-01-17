defmodule SortingHat.Endpoint do
  use Phoenix.Endpoint, otp_app: :sorting_hat

  socket "/socket", SortingHat.UserSocket

  plug Plug.Static,
    at: "/", from: :sorting_hat, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

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
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

 plug Plug.Session,
    store: :cookie,
    key: "_sorting_hat_key",
    signing_salt: "T+Ey6Gtr"

  plug SortingHat.Router
end
