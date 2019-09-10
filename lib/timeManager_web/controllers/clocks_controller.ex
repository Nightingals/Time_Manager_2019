defmodule TimeManagerWeb.ClocksController do
  use TimeManagerWeb, :controller

  alias TimeManager.Auth
  alias TimeManager.Auth.Clocks

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    clocks = Auth.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clocks" => clocks_params}) do
    with {:ok, %Clocks{} = clocks} <- Auth.create_clocks(clocks_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clocks_path(conn, :show, clocks))
      |> render("show.json", clocks: clocks)
    end
  end

  def show(conn, %{"id" => id}) do
    clocks = Auth.get_clocks!(id)
    render(conn, "show.json", clocks: clocks)
  end

  def update(conn, %{"id" => id, "clocks" => clocks_params}) do
    clocks = Auth.get_clocks!(id)

    with {:ok, %Clocks{} = clocks} <- Auth.update_clocks(clocks, clocks_params) do
      render(conn, "show.json", clocks: clocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    clocks = Auth.get_clocks!(id)

    with {:ok, %Clocks{}} <- Auth.delete_clocks(clocks) do
      send_resp(conn, :no_content, "")
    end
  end
end
