require 'syro'
require 'yaks'

require "yaks/syro/version"

module Yaks
  module Syro
    def self.included(deck)
      deck.extend ClassMethods
    end

    def yaks(object, opts = {})
      runner = self.class.yaks_config.runner(object, {env: env}.merge(opts))

      res.headers["Content-Type"] = runner.media_type
      res.write runner.call
    end

    module ClassMethods
      attr_reader :yaks_config

      def configure_yaks(&block)
        @yaks_config = ::Yaks.new(&block)
      end
    end
  end
end
