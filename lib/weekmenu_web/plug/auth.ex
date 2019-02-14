defmodule WeekmenuWeb.Auth do
  @moduledoc """
  Provides user authentication-related plugs and other helper functions.
  """

  import Plug.Conn
  import Phoenix.Controller

  alias Weekmenu.Repo
  alias Weekmenu.Accounts
  alias Weekmenu.Accounts.User

  alias WeekmenuWeb.Router.Helpers

  def fetch_current_user_by_session(conn, _opts \\ []) do
    user_id = get_session(conn, :user_id)

    if user_id do
      with {:ok, user} <- Accounts.find_user_by_id(user_id) do
        sign_in(conn, user)
      else
        _ ->
          delete_current_user(conn)
      end
    else
      delete_current_user(conn)
    end
  end

  def redirect_unless_signed_in(conn, _opts \\ []) do
    if conn.assigns[:current_user] do
      conn
    else
      conn
      |> redirect(to: Helpers.session_path(conn, :new))
      |> halt()
    end
  end

  def sign_in(conn, user) do
    conn
    |> put_current_user(user)
    |> put_session(:user_id, user.id)
  end

  def authenticate_with_credentials(conn, email, password) do
    user = Repo.get_by(User, email: email)

    if user && Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
      {:ok, sign_in(conn, user)}
    else
      Comeonin.Bcrypt.dummy_checkpw()
      {:error, conn}
    end
  end

  defp put_current_user(conn, user) do
    conn
    |> assign(:current_user, user)
  end

  defp delete_current_user(conn) do
    assign(conn, :current_user, nil)
  end
end
