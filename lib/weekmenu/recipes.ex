defmodule Weekmenu.Recipes do
  import Ecto.Query, warn: false
  alias Weekmenu.Repo
  alias Weekmenu.Schemas.Recipe

  def list_recipes do
    Recipe
    |> ordered
    |> Repo.all()
  end

  defp ordered(query) do
    query
    |> order_by(desc: :inserted_at)
  end
end
