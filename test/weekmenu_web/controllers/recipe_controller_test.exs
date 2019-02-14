defmodule WeekmenuWeb.RecipeControllerTest do
  use WeekmenuWeb.ConnCase

  describe ".index" do
    @tag :as_user
    test "lists all recipes", %{conn: conn} do
      recipes = insert_list(5, :recipe)
      conn = get(conn, Routes.recipe_path(conn, :index))

      for recipe <- recipes do
        assert html_response(conn, 200) =~ recipe.name
      end
    end
  end
end
