defmodule WeekmenuWeb.RecipeControllerTest do
  use WeekmenuWeb.ConnCase

  describe "GET /" do
    @tag :as_user
    test "lists all recipes", %{conn: conn} do
      recipes = insert_list(5, :recipe)
      conn = get(conn, Routes.recipe_path(conn, :index))

      for recipe <- recipes do
        assert html_response(conn, 200) =~ recipe.name
      end
    end
  end

  describe "GET /recipes" do
    @tag :as_user
    test "renders new form", %{conn: conn} do
      conn = get(conn, Routes.recipe_path(conn, :new))
      assert html_response(conn, 200) =~ "Add your recipe"
    end
  end

  describe "POST /recipes" do
    @tag :as_user
    test "with valid params creates a recipe for user", %{
      conn: conn
    } do
      attrs = %{name: "Some Recipe"}
      conn = post(conn, Routes.recipe_path(conn, :create), recipe: attrs)

      assert redirected_to(conn) == Routes.recipe_path(conn, :index)
    end
  end
end
