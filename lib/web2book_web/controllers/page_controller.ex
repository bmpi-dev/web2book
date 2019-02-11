defmodule Web2bookWeb.PageController do
  use Web2bookWeb, :controller

  def index(conn, _params) do
    render(conn, "app.html")
  end

  def inbox(conn, %{"email" => email, "url" => url} = data) do
    IO.puts "email is #{email}, url is #{url}"
    IO.puts "start get pdf from url #{url}"
    path = GitHubParse.markdown_to_pdf url, 2, false
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(Map.put(data, :path, Enum.at(Tuple.to_list(path), 1)), pretty: true))
  end
end
