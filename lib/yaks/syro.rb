require 'syro'
require 'yaks'

require "yaks/syro/version"

module Yaks # :nodoc:

  # Yaks integration for Syro
  module Syro
    def self.included(deck)
      deck.extend ClassMethods
    end

    # Render a yaks from inside a Syro route.
    #
    # @params object The object you want to render
    # @params opts [Hash] render options
    # @option opts [Class] :mapper The mapper class to use
    # @option opts [Symbol] :format The serialization format to use
    #
    def yaks(object, opts = {})
      runner = self.class.yaks_config.runner(object, {env: env}.merge(opts))

      res.headers["Content-Type"] = runner.media_type
      res.write runner.call
    end

    module ClassMethods

      # Yaks configuration object
      #
      # @return [Yaks]
      attr_reader :yaks_config

      # Configure Yaks
      #
      # @example
      #     class MyApp < Syro::Deck
      #       include Yaks::Syro
      #
      #       configure_yaks do
      #         default_format :hal
      #         rel_template 'http://api.example.com/rels/{rel}'
      #         format_options(:hal, plural_links: [:copyright])
      #         mapper_namespace ::MyAPI
      #         json_serializer do |data|
      #           JSON.dump(data)
      #         end
      #       end
      #     end
      #
      def configure_yaks(&block)
        @yaks_config = ::Yaks.new(&block)
      end
    end
  end
end
