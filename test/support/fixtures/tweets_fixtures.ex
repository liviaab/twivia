defmodule Twivia.TweetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Twivia.Tweets` context.
  """

  @doc """
  Generate a tweet.
  """
  def tweet_fixture(attrs \\ %{}) do
    {:ok, tweet} =
      attrs
      |> Enum.into(%{
        author_id: 42,
        content: "some content"
      })
      |> Twivia.Tweets.create_tweet()

    tweet
  end

  @doc """
  Generate a interaction.
  """
  def interaction_fixture(attrs \\ %{}) do
    {:ok, interaction} =
      attrs
      |> Enum.into(%{
        author_id: 42,
        content: "some content",
        tweet_id: 42,
        type: "some type"
      })
      |> Twivia.Tweets.create_interaction()

    interaction
  end
end
