defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TimeManagerWeb do
    pipe_through :api

    resources "/users", UsersController, except: [:new, :edit]
    resources "/clocks", ClocksController, except: [:new, :edit, :update, :delete]
    resources "/workingtimes", WorkingTimesController, except: [:new, :edit]
  end
end
