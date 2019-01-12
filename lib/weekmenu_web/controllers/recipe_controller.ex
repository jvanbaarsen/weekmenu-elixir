defmodule WeekmenuWeb.RecipeController do
  use WeekmenuWeb, :controller

  alias Weekmenu.Schemas.Recipe
  alias Weekmenu.Recipes

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.html", recipes: recipes)
  end
end
