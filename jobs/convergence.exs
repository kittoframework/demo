use Kitto.Job.DSL

{:ok, convergence} = Kitto.Jobs.Convergence.new
points = &(&1 |> Kitto.Jobs.Convergence.points)

job :convergence, every: {2, :seconds} do
  broadcast! %{points: convergence |> points.()}
end
