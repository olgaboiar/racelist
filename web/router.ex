defmodule Racelist.Router do
  use Racelist.Web, :router

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

  scope "/", Racelist do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", Racelist do
    pipe_through :browser

    get "/:provider", SessionController, :request
  end

  # Other scopes may use custom stacks.
  # scope "/api", Racelist do
  #   pipe_through :api
  # end
end
