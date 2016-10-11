defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixApi do
    pipe_through :api
    resources "/posts", PostController
    post "/registrations", RegistrationController, :create
  end

end
