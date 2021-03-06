defmodule SchoolDiary.Router do
  use SchoolDiary.Web, :router

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

  scope "/", SchoolDiary do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    post "/contact_request", PageController, :contact_request
    get "/login", PageController, :request_account_name
    post "/validate_account_name", PageController, :validate_account_name
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchoolDiary do
  #   pipe_through :api
  # end
end
