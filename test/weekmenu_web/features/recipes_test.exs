defmodule RecipesTest do
  import Ecto.Query, warn: false
  use WeekmenuWeb.IntegrationCase

  describe "adding a recipe" do
    test "with the correct information is successful", _meta do
      sign_in()

      assert Repo.one(from r in "recipes", select: count(r.id)) == 0

      navigate_to("/recipes/new")

      form = find_element(:tag, "form")

      form
      |> find_within_element(:name, "recipe[name]")
      |> fill_field("Recipe name")

      submit_element(form)

      assert Repo.one(from r in "recipes", select: count(r.id)) == 1
    end
  end
end
