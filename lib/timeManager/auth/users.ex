defmodule TimeManager.Auth.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, null:false
    field :username, :string, null:false

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email,~r/@/)
    |> unique_constraint(:email)
  end
end
