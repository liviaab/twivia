# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Twivia.Repo.insert!(%Twivia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Twivia.Accounts
alias Twivia.Tweets

{:ok, user1} = Accounts.create_user(%{
  email: "user1@domani.com",
  name: "User 1",
  password_hash: :rand.uniform(1_000_000) |> to_string(),
  username: "userrr_1"
})

{:ok, user2} = Accounts.create_user(%{
  email: "user2@domani.com",
  name: "User 2",
  password_hash: :rand.uniform(1_000_000) |> to_string(),
  username: "userrr_2"
})

{:ok, user3} = Accounts.create_user(%{
  email: "user2@domani.com",
  name: "User 2",
  password_hash: :rand.uniform(1_000_000) |> to_string(),
  username: "userrr_2"
})

{:ok, tweet1} = Tweets.create_tweet(%{
  author_id: user1.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

{:ok, tweet2} = Tweets.create_tweet(%{
  author_id: user2.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

{:ok, tweet3} = Tweets.create_tweet(%{
  author_id: user3.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

Tweets.create_tweet(%{
  author_id: user1.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

Tweets.create_tweet(%{
  author_id: user2.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

Tweets.create_tweet(%{
  author_id: user3.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a."
})

Tweets.create_interaction(%{
  author_id: user1.id,
  content: nil,
  tweet_id: tweet1.id,
  type: "favorite"
})

Tweets.create_interaction(%{
  author_id: user2.id,
  content: nil,
  tweet_id: tweet2.id,
  type: "retweet"
})

Tweets.create_interaction(%{
  author_id: user3.id,
  content: nil,
  tweet_id: tweet2.id,
  type: "favorite"
})

Tweets.create_interaction(%{
  author_id: user1.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla, erat vitae placerat dignissim, nisl massa molestie turpis, ac sollicitudin enim ex eget eros. Aenean fringilla augue tortor, ut malesuada eros ultricies a.",
  tweet_id: tweet3.id,
  type: "reply"
})
