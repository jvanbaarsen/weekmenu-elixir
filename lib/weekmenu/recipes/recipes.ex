defmodule Weekmenu.Recipes do
  import Ecto.Query, warn: false
  alias Weekmenu.Repo
  alias Weekmenu.Recipes.Recipe

  def list_recipes do
    Recipe
    |> ordered
    |> Repo.all()
  end

  def create(attrs) do
    %Recipe{}
    |> Recipe.changeset(attrs)
    |> Repo.insert()
  end

  defp ordered(query) do
    query
    |> order_by(desc: :inserted_at)
  end
end
