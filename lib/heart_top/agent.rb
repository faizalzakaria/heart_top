require 'heart_top/plugin'

class HeartTop::Agent
  PLUGINS = %i(slack)

  def initialize(interval: , verbose: )
    @interval = interval
    @verbose  = verbose
  end

  def run
    while true do
      execute_plugins
      sleep @interval
    end
  end

  private

  def execute_plugins
    puts 'executing ...' if @verbose
    PLUGINS.each do |plugin|
      Object.const_get("HeartTop::Plugin::#{plugin.capitalize}").send('ping')
    end
  end
end
