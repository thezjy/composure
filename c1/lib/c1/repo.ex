defmodule C1.Repo do
  use Ecto.Repo,
    otp_app: :c1,
    adapter: Ecto.Adapters.Postgres
end
