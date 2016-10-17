use Kitto.Job.DSL

job :twitter, every: {20, :seconds} do
  items = ExTwitter.search("elixir-lang", count: 2)
          |> Enum.map(fn (t) -> %{label: t.text, value: ""} end)

  broadcast!(:twitter, %{items: items})
end
