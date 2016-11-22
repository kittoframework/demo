use Kitto.Job.DSL

job :twitter, every: {20, :seconds} do
  items = ExTwitter.search("elixir-lang", count: 2)
          |> Enum.map(fn (t) -> %{label: t.text, value: ""} end)

  broadcast!(:twitter, %{items: items})
end

job :twitter_linux do
  spawn fn ->
    for tweet <- ExTwitter.stream_filter(track: "linux") do
      broadcast!(:twitter_linux, %{text: tweet.text})
    end
  end
end
