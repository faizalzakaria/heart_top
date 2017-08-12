# frozen_string_literal: true

require 'heart_top/plugin'

module HeartTop
  class Agent
    PLUGINS = %i[slack].freeze

    def initialize(interval:, verbose:)
      @interval = interval
      @verbose  = verbose
    end

    def run
      loop do
        execute_plugins
        sleep @interval
      end
    end

    private

    def execute_plugins
      puts 'executing ...' if @verbose
      PLUGINS.each do |plugin|
        Object.const_get("HeartTop::Plugin::#{plugin.capitalize}").instance.send('ping')
      end
    end
  end
end
