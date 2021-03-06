defmodule WeekmenuWeb.Router do
  use WeekmenuWeb, :router

  pipeline :anonymous_browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user_by_session
  end

  pipeline :authenticated_browser do
    plug :anonymous_browser
    plug :redirect_unless_signed_in
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeekmenuWeb do
    pipe_through :anonymous_browser

    get "/signup", UserController, :new
    post "/signup", UserController, :create
    get "/signin", SessionController, :new
    post "/signin", SessionController, :create
  end

  scope "/", WeekmenuWeb do
    pipe_through :authenticated_browser
    get "/", RecipeController, :index
    resources "/recipes", RecipeController
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: WeekmenuWeb.Schema,
      json_codec: Jason,
      socket: WeekmenuWeb.UserSocket,
      default_url: "/api"

    forward "/", Absinthe.Plug, schema: WeekmenuWeb.Schema, json_codec: Jason
  end
end
