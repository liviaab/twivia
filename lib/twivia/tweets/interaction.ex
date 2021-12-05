defmodule Twivia.Tweets.Interaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "interactions" do
    field :author_id, :integer
    field :content, :string
    field :tweet_id, :integer
    field :type, Ecto.Enum, values: [:favorite, :retweet, :reply]

    timestamps()
  end

  @doc false
  def changeset(interaction, attrs) do
    interaction
    |> cast(attrs, [:type, :author_id, :tweet_id, :content])
    |> validate_required([:type, :author_id, :tweet_id, :content])
  end
end
