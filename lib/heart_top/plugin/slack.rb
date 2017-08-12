module HeartTop
  module Plugin
    class Slack
      class << self
        def ping
          puts 'test'
          `curl -X POST --data-urlencode 'payload={"channel": "#hearttop", "username": "hearttop", "text": "This is posted to #hearttop and comes from a bot named hearttop.", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/<key>`
        end
      end
    end
  end
end
