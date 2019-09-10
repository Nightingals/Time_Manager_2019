defmodule TimeManager.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :tilme, :utc_datetime, null: false
      add :status, :boolean, default: false, null: false
      add :user, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:clocks, [:user])
    create constraint("clocks", "check_clock_can_be_opened","")
    create constraint("clocks", "check_clock_can_be_closed","")
  end
end
