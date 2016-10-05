Kitto.Job.every 2, :seconds, fn (notifier) ->
  items = ExTwitter.search("elixir-lang", count: 2)
  |> Enum.map(fn (t) ->
    %{label: t.text, value: ""}
  end)

  notifier.broadcast!(:twitter, %{items: items})
end
