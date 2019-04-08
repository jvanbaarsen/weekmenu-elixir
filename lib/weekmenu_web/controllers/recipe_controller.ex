defmodule WeekmenuWeb.RecipeController do
  use WeekmenuWeb, :controller

  alias Weekmenu.Recipes
  alias Weekmenu.Recipes.Recipe

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.html", recipes: recipes)
  end

  def new(conn, _params) do
    changeset = Recipe.changeset(%Recipe{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    case Recipes.create(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe is created")
        |> redirect(to: Routes.recipe_path(conn, :index))

      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render("new.html")
    end
  end
end
