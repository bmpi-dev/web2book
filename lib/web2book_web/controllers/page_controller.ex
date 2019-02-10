defmodule Web2bookWeb.PageController do
  use Web2bookWeb, :controller

  def index(conn, _params) do
    render(conn, "app.html")
  end
end
