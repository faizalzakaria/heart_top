# frozen_string_literal: true

# Base Plugin class
# Inherit this class if you adding a new plugin
module HeartTop
  module Plugin
    class Base
      class NotImplementedError < StandardError; end

      def ping
        raise NotImplementedError, "`##{__method__}` must be implemented in subclass"
      end
    end
  end
end
