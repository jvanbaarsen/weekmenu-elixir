defmodule Weekmenu.RecipesTest do
  use Weekmenu.DataCase

  alias Weekmenu.Recipes

  describe "list_recipes/0" do
    test "returns all recipes" do
      recipe_one = insert(:recipe, inserted_at: Timex.now())

      recipe_two =
        insert(:recipe,
          inserted_at: Timex.now() |> Timex.shift(minutes: 1)
        )

      assert Recipes.list_recipes() == [recipe_two, recipe_one]
    end
  end
end
