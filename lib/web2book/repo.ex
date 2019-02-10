defmodule Web2book.Repo do
  use Ecto.Repo,
    otp_app: :web2book,
    adapter: Ecto.Adapters.Postgres
end
