use Kitto.Job.DSL

{:ok, convergence} = Kitto.Jobs.Convergence.new
points = &(&1 |> Kitto.Jobs.Convergence.points)

job :convergence, every: {2, :seconds} do
  broadcast! :convergence, %{points: convergence |> points.()}
end
