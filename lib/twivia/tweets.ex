defmodule Twivia.Tweets do
  @moduledoc """
  The Tweets context.
  """

  import Ecto.Query, warn: false
  alias Twivia.Repo

  alias Twivia.Tweets.Tweet

  @doc """
  Returns the list of tweets.

  ## Examples

      iex> list_tweets()
      [%Tweet{}, ...]

  """
  def list_tweets do
    Repo.all(Tweet)
  end

  @doc """
  Gets a single tweet.

  Raises `Ecto.NoResultsError` if the Tweet does not exist.

  ## Examples

      iex> get_tweet!(123)
      %Tweet{}

      iex> get_tweet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tweet!(id), do: Repo.get!(Tweet, id)

  @doc """
  Creates a tweet.

  ## Examples

      iex> create_tweet(%{field: value})
      {:ok, %Tweet{}}

      iex> create_tweet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tweet(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tweet.

  ## Examples

      iex> update_tweet(tweet, %{field: new_value})
      {:ok, %Tweet{}}

      iex> update_tweet(tweet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tweet(%Tweet{} = tweet, attrs) do
    tweet
    |> Tweet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tweet.

  ## Examples

      iex> delete_tweet(tweet)
      {:ok, %Tweet{}}

      iex> delete_tweet(tweet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tweet(%Tweet{} = tweet) do
    Repo.delete(tweet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tweet changes.

  ## Examples

      iex> change_tweet(tweet)
      %Ecto.Changeset{data: %Tweet{}}

  """
  def change_tweet(%Tweet{} = tweet, attrs \\ %{}) do
    Tweet.changeset(tweet, attrs)
  end

  alias Twivia.Tweets.Interaction

  @doc """
  Returns the list of interactions.

  ## Examples

      iex> list_interactions()
      [%Interaction{}, ...]

  """
  def list_interactions do
    Repo.all(Interaction)
  end

  @doc """
  Gets a single interaction.

  Raises `Ecto.NoResultsError` if the Interaction does not exist.

  ## Examples

      iex> get_interaction!(123)
      %Interaction{}

      iex> get_interaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_interaction!(id), do: Repo.get!(Interaction, id)

  @doc """
  Creates a interaction.

  ## Examples

      iex> create_interaction(%{field: value})
      {:ok, %Interaction{}}

      iex> create_interaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_interaction(attrs \\ %{}) do
    %Interaction{}
    |> Interaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a interaction.

  ## Examples

      iex> update_interaction(interaction, %{field: new_value})
      {:ok, %Interaction{}}

      iex> update_interaction(interaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_interaction(%Interaction{} = interaction, attrs) do
    interaction
    |> Interaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a interaction.

  ## Examples

      iex> delete_interaction(interaction)
      {:ok, %Interaction{}}

      iex> delete_interaction(interaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_interaction(%Interaction{} = interaction) do
    Repo.delete(interaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking interaction changes.

  ## Examples

      iex> change_interaction(interaction)
      %Ecto.Changeset{data: %Interaction{}}

  """
  def change_interaction(%Interaction{} = interaction, attrs \\ %{}) do
    Interaction.changeset(interaction, attrs)
  end
end
