defmodule WeekmenuWeb.PageControllerTest do
  use WeekmenuWeb.ConnCase

  @tag :as_user
  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Weekmenu"
  end
end
