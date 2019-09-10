defmodule TimeManager.Auth.Clocks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: false
    field :tilme, :utc_datetime
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(clocks, attrs) do
    clocks
    |> cast(attrs, [:tilme, :status])
    |> validate_required([:tilme, :status])
  end
end
