defmodule WeekmenuWeb.UserControllerTest do
  use WeekmenuWeb.ConnCase

  describe "new" do
    test "renders the signup form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "Signup"
    end
  end

  describe "create" do
    test "with valid params a user should be able to signup", %{conn: conn} do
      attrs = %{name: "User", email: "user@example.com", password: "12345"}
      conn = post(conn, Routes.user_path(conn, :create), user: attrs)

      assert redirected_to(conn) == Routes.recipe_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      invalid_attrs = %{}
      conn = post(conn, Routes.user_path(conn, :create), user: invalid_attrs)
      assert html_response(conn, 200) =~ "Signup"
    end
  end
end
