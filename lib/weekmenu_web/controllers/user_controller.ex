defmodule WeekmenuWeb.UserController do
  use WeekmenuWeb, :controller

  alias Weekmenu.Accounts
  alias Weekmenu.Accounts.User
  alias WeekmenuWeb.Auth

  def new(conn, _params) do
    changeset = User.signup_changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create(user_params) do
      {:ok, user} ->
        conn
        |> Auth.sign_in(user)
        |> put_flash(:info, "Signup was successfull")
        |> redirect(to: Routes.recipe_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
