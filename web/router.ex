defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", PhoenixApi do
    pipe_through :api
    resources "/posts", PostController
    post "/registrations", RegistrationController, :create

    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete

    get "/current_user", CurrentUserController, :show
  end

end
