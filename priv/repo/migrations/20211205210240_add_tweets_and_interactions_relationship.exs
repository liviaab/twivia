defmodule Twivia.Repo.Migrations.AddTweetsAndInteractionsRelationship do
  use Ecto.Migration

  def change do
    alter table(:interactions) do
      modify :author_id, references(:users)
      modify :tweet_id, references(:tweets)
    end

    create index(:interactions, [:type, :author_id])
    create unique_index(:interactions, [:type, :author_id, :tweet_id])
  end
end
