defmodule Racelist.Router do
  use Racelist.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Racelist.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Racelist do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", Racelist do
    pipe_through :browser

    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  scope "/races", Racelist do
    pipe_through :browser

    resources "/", RaceController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Racelist do
  #   pipe_through :api
  # end
end
