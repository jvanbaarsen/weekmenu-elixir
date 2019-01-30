defmodule WeekmenuWeb.SessionController do
  use WeekmenuWeb, :controller

  alias WeekmenuWeb.Auth

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Auth.authenticate_with_credentials(conn, email, password) do
      {:ok, conn} ->
        conn
        |> put_flash(:success, "Welcome back!")
        |> redirect(to: Routes.recipe_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Invalid email or password")
        |> render("new.html")
    end
  end
end
