defmodule TimeManagerWeb.ClocksView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.ClocksView

  def render("index.json", %{clocks: clocks}) do
    %{data: render_many(clocks, ClocksView, "clocks.json")}
  end

  def render("show.json", %{clocks: clocks}) do
    %{data: render_one(clocks, ClocksView, "clocks.json")}
  end

  def render("clocks.json", %{clocks: clocks}) do
    %{id: clocks.id,
      time: clocks.time,
      status: clocks.status}
  end
end
