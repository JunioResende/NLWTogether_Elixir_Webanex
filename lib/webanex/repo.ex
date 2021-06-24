defmodule Webanex.Repo do
  use Ecto.Repo,
    otp_app: :webanex,
    adapter: Ecto.Adapters.Postgres
end
