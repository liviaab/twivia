defmodule TwiviaWeb.InteractionView do
  use TwiviaWeb, :view
  alias TwiviaWeb.InteractionView

  def render("index.json", %{interactions: interactions}) do
    %{data: render_many(interactions, InteractionView, "interaction.json")}
  end

  def render("show.json", %{interaction: interaction}) do
    %{data: render_one(interaction, InteractionView, "interaction.json")}
  end

  def render("interaction.json", %{interaction: interaction}) do
    %{
      id: interaction.id,
      type: interaction.type,
      author_id: interaction.author_id,
      tweet_id: interaction.tweet_id,
      content: interaction.content
    }
  end
end
