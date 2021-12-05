defmodule TwiviaWeb.TweetView do
  use TwiviaWeb, :view
  alias TwiviaWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      author_id: tweet.author_id,
      content: tweet.content
    }
  end
end
