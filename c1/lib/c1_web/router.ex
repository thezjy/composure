defmodule C1Web.Router do
  use C1Web, :router

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

  scope "/", C1Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/graphql", Absinthe.Plug, schema: C1Web.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: C1Web.Schema,
    interface: :simple,
    socket: C1Web.UserSocket

  # Other scopes may use custom stacks.
  # scope "/api", C1Web do
  #   pipe_through :api
  # end
end
