defmodule Weekmenu.Factory do
  use ExMachina.Ecto, repo: Weekmenu.Repo

  def recipe_factory do
    %Weekmenu.Schemas.Recipe{
      name: sequence(:name, &"Some Recipe Number #{&1}")
    }
  end
end
