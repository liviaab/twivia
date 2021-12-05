defmodule TwiviaWeb.InteractionController do
  use TwiviaWeb, :controller

  alias Twivia.Tweets
  alias Twivia.Tweets.Interaction

  action_fallback TwiviaWeb.FallbackController

  def index(conn, _params) do
    interactions = Tweets.list_interactions()
    render(conn, "index.json", interactions: interactions)
  end

  def create(conn, %{"interaction" => interaction_params}) do
    with {:ok, %Interaction{} = interaction} <- Tweets.create_interaction(interaction_params) do
      conn
      |> put_status(:created)
      |> render("show.json", interaction: interaction)
    end
  end

  def show(conn, %{"id" => id}) do
    interaction = Tweets.get_interaction!(id)
    render(conn, "show.json", interaction: interaction)
  end

  def update(conn, %{"id" => id, "interaction" => interaction_params}) do
    interaction = Tweets.get_interaction!(id)

    with {:ok, %Interaction{} = interaction} <- Tweets.update_interaction(interaction, interaction_params) do
      render(conn, "show.json", interaction: interaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    interaction = Tweets.get_interaction!(id)

    with {:ok, %Interaction{}} <- Tweets.delete_interaction(interaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
