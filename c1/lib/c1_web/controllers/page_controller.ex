defmodule C1Web.PageController do
  use C1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
