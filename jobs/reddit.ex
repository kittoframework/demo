Kitto.Job.every 2, :seconds, fn (notifier) ->
  subreddit = "elixir"
  max_posts = 5

  headers = [%{label: "Posts", value: "Score"}]
  items = Demo.Reddit.r(subreddit)["data"]["children"]
    |> Enum.take(max_posts)
    |> Enum.map(fn (%{"data" => post}) ->
      %{label: post["title"], value: post["score"]}
    end)

  notifier.broadcast!(:reddit, %{items: headers ++ items})
end
