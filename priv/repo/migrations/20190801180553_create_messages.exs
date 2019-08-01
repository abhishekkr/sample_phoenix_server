defmodule HelloPhoenix.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :from, :string
      add :msg, :text

      timestamps()
    end

  end
end
