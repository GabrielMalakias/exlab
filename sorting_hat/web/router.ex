defmodule SortingHat.Router do
  use SortingHat.Web, :router

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

  scope "/", SortingHat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

   scope "/api", SortingHat do
     pipe_through :api

     scope "/monitoring" do
      get "/heart_beat", MonitoringController, :heart_beat
     end
   end
end
