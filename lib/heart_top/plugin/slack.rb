# -*- coding: undecided -*-
# frozen_string_literal: true

require 'heart_top/plugin/base'
require 'singleton'
require 'json'

module HeartTop
  module Plugin
    class Slack < Base
      include Singleton

      def ping
        `curl -X POST --data-urlencode 'payload=#{payload}' #{webhook_url}`
      end

      private

      def payload
        {
          channel: '#hearttop',
          username: 'hearttop',
          text: " ❤ #{Time.now}",
          icon_emoji: ':ghost:'
        }.to_json.to_s
      end

      def webhook_url
        ENV['SLACK_WEBHOOK_URL']
      end
    end
  end
end
