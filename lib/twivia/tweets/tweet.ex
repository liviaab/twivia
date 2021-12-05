defmodule Twivia.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :author_id, :integer
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:author_id, :content])
    |> validate_required([:author_id, :content])
  end
end
