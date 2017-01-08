use Kitto.Job.DSL

job :users, every: :second do
  broadcast! %{value: Kitto.Notifier.connections |> Enum.count}
end
