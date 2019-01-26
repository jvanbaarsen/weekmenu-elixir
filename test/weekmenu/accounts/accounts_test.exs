defmodule Weekmenu.AccountsTest do
  use Weekmenu.DataCase

  alias Weekmenu.Accounts
  alias Weekmenu.Accounts.User

  describe "create/1" do
    test "With valid data it creates a new user" do
      valid_attrs = %{
        email: "some email",
        password: "some encrypted_password",
        name: "some name"
      }

      assert {:ok, %User{} = user} = Accounts.create(valid_attrs)
      assert user.email == "some email"
      assert user.encrypted_password != nil
      assert user.name == "some name"
    end

    test "With invalid data it doesn't create a new user" do
      invalid_attrs = %{email: nil, password: nil, name: nil}

      assert {:error, %Ecto.Changeset{}} = Accounts.create(invalid_attrs)
    end
  end
end
