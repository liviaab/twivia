defmodule Twivia.Repo.Migrations.AddUsernameIndex do
  use Ecto.Migration

  def change do
    create index(:users, [:username])
  end
end
