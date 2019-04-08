defmodule WeekmenuWeb.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers
      use Phoenix.ConnTest

      import WeekmenuWeb.Router.Helpers
      import Weekmenu.Factory
      import WeekmenuWeb.IntegrationCase

      alias Weekmenu.Repo

      # The default endpoint for testing
      @endpoint WeekmenuWeb.Endpoint

      hound_session()
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Weekmenu.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Weekmenu.Repo, {:shared, self()})
    end

    :ok
  end

  def sign_in() do
    user = Weekmenu.Factory.insert(:user)

    Hound.Helpers.Navigation.navigate_to("/signin")

    form = find_element(:tag, "form")

    form
    |> find_within_element(:name, "session[email]")
    |> fill_field(user.email)

    form
    |> find_within_element(:name, "session[password]")
    |> fill_field("password")

    submit_element(form)
  end
end
