defmodule Twivia.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :author_id, :integer
      add :content, :string

      timestamps()
    end
  end
end
