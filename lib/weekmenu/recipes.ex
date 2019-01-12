defmodule Weekmenu.Recipes do
  import Ecto.Query, warn: false
  alias Weekmenu.Repo
  alias Weekmenu.Schemas.Recipe

  def list_recipes do
    Repo.all(Recipe)
  end
end
