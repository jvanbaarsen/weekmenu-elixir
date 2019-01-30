defmodule WeekmenuWeb.AuthTest do
  use WeekmenuWeb.ConnCase

  alias WeekmenuWeb.Auth
  alias Weekmenu.Accounts.User

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(WeekmenuWeb.Router, :anonymous_browser)
      |> get("/")

    {:ok, %{conn: conn}}
  end

  describe ".sign_in" do
    test "assigns the given user to the connection", %{conn: conn} do
      assert conn.assigns[:current_user] == nil

      user = %User{id: 1}
      conn = Auth.sign_in(conn, user)

      assert conn.assigns[:current_user] == user
    end

    test "sets the user id to the session", %{conn: conn} do
      assert get_session(conn, :user_id) == nil

      user = %User{id: 1}
      conn = Auth.sign_in(conn, user)

      assert get_session(conn, :user_id) == user.id
    end
  end

  describe ".authenticate_with_credentials" do
    test "returns an OK tupple on success", %{conn: conn} do
      user = insert(:user)

      {response, _} = Auth.authenticate_with_credentials(conn, user.email, "password")
      assert response == :ok
    end

    test "returns an ERROR tupple on unknown user", %{conn: conn} do
      {response, _} = Auth.authenticate_with_credentials(conn, "invalid", "invalid")
      assert response == :error
    end

    test "return an ERROR tupple on invalid password", %{conn: conn} do
      user = insert(:user)

      {response, _} = Auth.authenticate_with_credentials(conn, user.email, "invalid")
      assert response == :error
    end
  end
end
