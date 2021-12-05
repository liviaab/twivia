defmodule Twivia.Repo.Migrations.AddTweetsAndAuthorRelationship do
  use Ecto.Migration

  def change do
    alter table(:tweets) do
      modify :author_id, references(:users)
    end

    create index(:tweets, [:author_id])
  end
end
