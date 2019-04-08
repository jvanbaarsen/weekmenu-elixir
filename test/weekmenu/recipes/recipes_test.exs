defmodule Weekmenu.RecipesTest do
  use Weekmenu.DataCase

  alias Weekmenu.Recipes
  alias Weekmenu.Recipes.Recipe

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

  describe "create/1" do
    test "with valid data it creates a new recipe" do
      valid_attrs = %{
        name: "some name"
      }

      assert {:ok, %Recipe{} = recipe} = Recipes.create(valid_attrs)
      assert recipe.name == "some name"
    end

    test "With invalid data it doesn't create a new recipe" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create(%{})
    end
  end
end
