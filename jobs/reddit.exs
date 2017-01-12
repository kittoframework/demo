use Kitto.Job.DSL

job :reddit, every: {2, :seconds} do
  subreddit = "elixir"
  max_posts = 5

  headers = [%{label: "posts", value: "score"}]
  items = Demo.Reddit.r(subreddit)["data"]["children"]
          |> Enum.take(max_posts)
          |> Enum.map(fn (%{"data" => post}) ->
    %{label: post["title"], value: post["score"]}
  end)

  broadcast! %{items: headers ++ items}
end
