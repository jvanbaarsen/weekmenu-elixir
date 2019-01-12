defmodule WeekmenuWeb.Router do
  use WeekmenuWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeekmenuWeb do
    pipe_through :browser

    get "/", RecipeController, :index
    resources "/recipes", RecipeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeekmenuWeb do
  #   pipe_through :api
  # end
end
