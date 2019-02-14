defmodule Weekmenu.Accounts do
  import Ecto.Query, warn: false
  alias Weekmenu.Repo

  alias Weekmenu.Accounts.User

  def create(attrs \\ %{}) do
    %User{}
    |> User.signup_changeset(attrs)
    |> Repo.insert()
  end

  def find_user_by_id(id) do
    if(user = Repo.get_by(User, id: id)) do
      {:ok, user}
    else
      {:error, "user not found"}
    end
  end
end
