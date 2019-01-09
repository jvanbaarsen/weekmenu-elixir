defmodule WeekmenuWeb.PageController do
  use WeekmenuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
