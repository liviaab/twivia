defmodule Twivia.TweetsTest do
  use Twivia.DataCase

  alias Twivia.Tweets

  describe "tweets" do
    alias Twivia.Tweets.Tweet

    import Twivia.TweetsFixtures

    @invalid_attrs %{author_id: nil, content: nil}

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Tweets.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Tweets.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      valid_attrs = %{author_id: 42, content: "some content"}

      assert {:ok, %Tweet{} = tweet} = Tweets.create_tweet(valid_attrs)
      assert tweet.author_id == 42
      assert tweet.content == "some content"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tweets.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      update_attrs = %{author_id: 43, content: "some updated content"}

      assert {:ok, %Tweet{} = tweet} = Tweets.update_tweet(tweet, update_attrs)
      assert tweet.author_id == 43
      assert tweet.content == "some updated content"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tweets.update_tweet(tweet, @invalid_attrs)
      assert tweet == Tweets.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Tweets.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Tweets.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Tweets.change_tweet(tweet)
    end
  end

  describe "interactions" do
    alias Twivia.Tweets.Interaction

    import Twivia.TweetsFixtures

    @invalid_attrs %{author_id: nil, content: nil, tweet_id: nil, type: nil}

    test "list_interactions/0 returns all interactions" do
      interaction = interaction_fixture()
      assert Tweets.list_interactions() == [interaction]
    end

    test "get_interaction!/1 returns the interaction with given id" do
      interaction = interaction_fixture()
      assert Tweets.get_interaction!(interaction.id) == interaction
    end

    test "create_interaction/1 with valid data creates a interaction" do
      valid_attrs = %{author_id: 42, content: "some content", tweet_id: 42, type: "some type"}

      assert {:ok, %Interaction{} = interaction} = Tweets.create_interaction(valid_attrs)
      assert interaction.author_id == 42
      assert interaction.content == "some content"
      assert interaction.tweet_id == 42
      assert interaction.type == "some type"
    end

    test "create_interaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tweets.create_interaction(@invalid_attrs)
    end

    test "update_interaction/2 with valid data updates the interaction" do
      interaction = interaction_fixture()
      update_attrs = %{author_id: 43, content: "some updated content", tweet_id: 43, type: "some updated type"}

      assert {:ok, %Interaction{} = interaction} = Tweets.update_interaction(interaction, update_attrs)
      assert interaction.author_id == 43
      assert interaction.content == "some updated content"
      assert interaction.tweet_id == 43
      assert interaction.type == "some updated type"
    end

    test "update_interaction/2 with invalid data returns error changeset" do
      interaction = interaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Tweets.update_interaction(interaction, @invalid_attrs)
      assert interaction == Tweets.get_interaction!(interaction.id)
    end

    test "delete_interaction/1 deletes the interaction" do
      interaction = interaction_fixture()
      assert {:ok, %Interaction{}} = Tweets.delete_interaction(interaction)
      assert_raise Ecto.NoResultsError, fn -> Tweets.get_interaction!(interaction.id) end
    end

    test "change_interaction/1 returns a interaction changeset" do
      interaction = interaction_fixture()
      assert %Ecto.Changeset{} = Tweets.change_interaction(interaction)
    end
  end
end
