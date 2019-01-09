defmodule Weekmenu.Repo do
  use Ecto.Repo,
    otp_app: :weekmenu,
    adapter: Ecto.Adapters.Postgres
end
