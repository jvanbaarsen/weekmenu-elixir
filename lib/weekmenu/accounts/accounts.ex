defmodule Weekmenu.Accounts do
  import Ecto.Query, warn: false
  alias Weekmenu.Repo

  alias Weekmenu.Accounts.User

  def create(attrs \\ %{}) do
    %User{}
    |> User.signup_changeset(attrs)
    |> Repo.insert()
  end
end
