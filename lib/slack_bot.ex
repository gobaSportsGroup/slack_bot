defmodule SlackBot do
  use Slack

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    send_message("I got a message!", message.channel, slack)
    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}

  def handle_info({:message, text, channel}, slack, state) do
    IO.puts "Sending your message, captain!"

    send_message(text, channel, slack)

    {:ok, state}
  end
  def handle_info(_, _, state), do: {:ok, state}
end

# Slack.Bot.start_link(SlackBot, [], "xoxp-208466254181-214968086487-877321047588-642aa7d69fb1a89a5d1af80823f05dae")

# 208466254181.877784429717.ee79b35d36b89bd044d057d558ccbd1398c37ee67fab2f0e850cd425c4fa4054

# curl -XPOST 'https://slack.com/api/oauth.access?client_id=208466254181.877781665445&client_secret=21fdc82501ddddbf8f2a668c8839df5c&code=208466254181.877784429717.ee79b35d36b89bd044d057d558ccbd1398c37ee67fab2f0e850cd425c4fa4054&redirect_uri=http://localhost:3000/callback'

# {"ok":true,"access_token":"xoxp-208466254181-214968086487-877321047588-642aa7d69fb1a89a5d1af80823f05dae","scope":"read,client,admin,identify,post","user_id":"U6AUG2JEB","team_id":"T64DQ7G5B","enterprise_id":null,"team_name":"Goba Sports Group"}

# https://github.com/blaskovicz/cut-me-some-slack#creating-a-slack-access-token
