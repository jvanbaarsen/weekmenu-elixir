defmodule WeekmenuWeb.Auth do
  @moduledoc """
  Provides user authentication-related plugs and other helper functions.
  """

  import Plug.Conn

  alias Weekmenu.Repo
  alias Weekmenu.Accounts.User

  def fetch_current_user_by_session(conn, _opts) do
    # user_id = get_session(conn, :user_id)
    # user = Repo.get_by(User, id: user_id)

    # # TODO Add proper check if user_id is valid
    # conn
    # |> put_current_user(user)
    conn
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
end
