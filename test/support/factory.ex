defmodule Weekmenu.Factory do
  use ExMachina.Ecto, repo: Weekmenu.Repo

  alias Comeonin.Bcrypt

  def recipe_factory do
    %Weekmenu.Recipes.Recipe{
      name: sequence(:name, &"Some Recipe Number #{&1}")
    }
  end

  def user_factory do
    %Weekmenu.Accounts.User{
      name: sequence(:name, &"User #{&1}"),
      email: sequence(:email, &"user#{&1}@example.com"),
      encrypted_password: Bcrypt.hashpwsalt("password")
    }
  end
end
