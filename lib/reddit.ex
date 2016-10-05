defmodule Demo.Reddit do
  @base_url "https://www.reddit.com/"

  def r(topic) do
    %{body: body} = (@base_url <> "r/" <> topic <> ".json") |> HTTPoison.get!(%{})

    body |> Poison.decode!
  end
end
