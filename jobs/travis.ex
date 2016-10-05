Kitto.Job.every 2, :seconds, fn (notifier) ->
  repo_names = ~w[elixir-lang/elixir elixir-lang/plug elixir-lang/ex_doc
   elixir-ecto/ecto phoenixframework/phoenix hexpm/hex kittoframework/kitto
   rrrene/credo edgurgel/httpoison bitwalker/distillery rails/rails]

  statuses = fn (status) ->
    case status do
      0 -> "success"
      1 -> "failure"
      _ -> "unknown"
    end
  end

  builds = repo_names |> Enum.map(fn (repo) ->
    %{label: repo, value: Demo.Travis.repo(repo)["last_build_status"] |> statuses.()}
  end)

  notifier.broadcast!(:travis, %{items: builds})
end
