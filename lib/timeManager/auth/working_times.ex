defmodule TimeManager.Auth.WorkingTimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :utc_datetime, null:false
    field :start, :utc_datetime, null:false
    field :user, :id, null:false

    timestamps()
  end

  @doc false
  def changeset(working_times, attrs) do
    working_times
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end, :user_id])
  end
end
