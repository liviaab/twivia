defmodule Twivia.Repo do
  use Ecto.Repo,
    otp_app: :twivia,
    adapter: Ecto.Adapters.Postgres
end
