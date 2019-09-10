defmodule TimeManagerWeb.WorkingTimesController do
  use TimeManagerWeb, :controller

  alias TimeManager.Auth
  alias TimeManager.Auth.WorkingTimes

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Auth.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"working_times" => working_times_params}) do
    with {:ok, %WorkingTimes{} = working_times} <- Auth.create_working_times(working_times_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_times_path(conn, :show, working_times))
      |> render("show.json", working_times: working_times)
    end
  end

  def show(conn, %{"id" => id}) do
    working_times = Auth.get_working_times!(id)
    render(conn, "show.json", working_times: working_times)
  end

  def update(conn, %{"id" => id, "working_times" => working_times_params}) do
    working_times = Auth.get_working_times!(id)

    with {:ok, %WorkingTimes{} = working_times} <- Auth.update_working_times(working_times, working_times_params) do
      render(conn, "show.json", working_times: working_times)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_times = Auth.get_working_times!(id)

    with {:ok, %WorkingTimes{}} <- Auth.delete_working_times(working_times) do
      send_resp(conn, :no_content, "")
    end
  end
end
