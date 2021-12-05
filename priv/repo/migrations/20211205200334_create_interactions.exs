defmodule Twivia.Repo.Migrations.CreateInteractions do
  use Ecto.Migration

  def change do
    create table(:interactions) do
      add :type, :string
      add :author_id, :integer
      add :tweet_id, :integer
      add :content, :string

      timestamps()
    end
  end
end
