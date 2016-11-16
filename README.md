# Demo

This demo app is deployed at http://kitto.io

The [heroku](https://github.com/kittoframework/demo/tree/heroku) branch of this repo is
also automatically deployed to heroku at: https://kitto.herokuapp.com

Example dashboards:

* http://kitto.io/dashboards/sample

![sample-dashboard](http://i.imgur.com/6iG6t7l.png)

* http://kitto.io/dashboards/elixir

![elixir-dashboard](http://i.imgur.com/70KYNTw.png)

* http://kitto.io/dashboards/jobs

![jobs-dashboard](http://i.imgur.com/DhNxq03.png)

To start your Dashboard:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start a development server with `mix kitto.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://github.com/kittoframework/kitto#deployment).

## Requirements

For platform requirements see: [here](https://github.com/kittoframework/kitto#requirements).

Some of the jobs in the demo make authenticated requests and have to be
configured in order to work.

### Travis

```elixir
# File: config/config.exs
config :kitto, travis_token: "add-your-token"
```

### Twitter

For available configuration options of the `extwitter` dependency,
consult the
[readme](https://github.com/parroty/extwitter/tree/v0.7.0#configuration).

```elixir
# File: config/config.exs
  config :extwitter, :oauth,
	 consumer_key: "your-consumer-key",
	 consumer_secret: "your-consumer-secret",
	 access_token: "your-access-token",
	 access_token_secret: "your-access-token-secret"
```

## Learn more

  * Official website: http://kitto.io
  * Source: https://github.com/kittoframework/kitto
