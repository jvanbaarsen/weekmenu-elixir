defmodule Weekmenu.RecipesTest do
  use Weekmenu.DataCase

  alias Weekmenu.Recipes

  describe "list_recipes/0" do
    test "returns all recipes" do
      recipe = insert(:recipe)
      assert Recipes.list_recipes() == [recipe]
    end
  end
end
