class HeartTop::Plugin::Base
  class NotImplementedError < StandardError; end

  class << self
    def ping
      raise NotImplementedError.new "`##{__method__}` must be implemented in subclass"
    end
  end
end
