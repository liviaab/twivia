defmodule TwiviaWeb.InteractionControllerTest do
  use TwiviaWeb.ConnCase

  import Twivia.TweetsFixtures

  alias Twivia.Tweets.Interaction

  @create_attrs %{
    author_id: 42,
    content: "some content",
    tweet_id: 42,
    type: "some type"
  }
  @update_attrs %{
    author_id: 43,
    content: "some updated content",
    tweet_id: 43,
    type: "some updated type"
  }
  @invalid_attrs %{author_id: nil, content: nil, tweet_id: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all interactions", %{conn: conn} do
      conn = get(conn, Routes.interaction_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create interaction" do
    test "renders interaction when data is valid", %{conn: conn} do
      conn = post(conn, Routes.interaction_path(conn, :create), interaction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.interaction_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author_id" => 42,
               "content" => "some content",
               "tweet_id" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.interaction_path(conn, :create), interaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update interaction" do
    setup [:create_interaction]

    test "renders interaction when data is valid", %{conn: conn, interaction: %Interaction{id: id} = interaction} do
      conn = put(conn, Routes.interaction_path(conn, :update, interaction), interaction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.interaction_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author_id" => 43,
               "content" => "some updated content",
               "tweet_id" => 43,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, interaction: interaction} do
      conn = put(conn, Routes.interaction_path(conn, :update, interaction), interaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete interaction" do
    setup [:create_interaction]

    test "deletes chosen interaction", %{conn: conn, interaction: interaction} do
      conn = delete(conn, Routes.interaction_path(conn, :delete, interaction))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.interaction_path(conn, :show, interaction))
      end
    end
  end

  defp create_interaction(_) do
    interaction = interaction_fixture()
    %{interaction: interaction}
  end
end
