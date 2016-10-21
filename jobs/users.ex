use Kitto.Job.DSL

job :users, every: :second do
  broadcast! :users, %{value: Kitto.Notifier.connections |> Enum.count}
end
