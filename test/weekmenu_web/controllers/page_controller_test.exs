defmodule WeekmenuWeb.PageControllerTest do
  use WeekmenuWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Weekmenu"
  end
end
