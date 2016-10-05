defmodule Demo.Travis do
  @base_url "https://api.travis-ci.org/"
  @token Application.get_env :kitto, :travis_token

  def repo(r) do
    %{body: body} = (@base_url <> "repos/" <> r) |> HTTPoison.get!(%{}, headers)

    body |> Poison.decode!
  end

  defp headers do
    [{"Authorization", "token #{@token}" }]
  end
end
