Kitto.Job.every :second, fn (notifier) ->
  notifier.broadcast! :users, %{value: Kitto.Notifier.connections |> Enum.count}
end
