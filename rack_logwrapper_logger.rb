require 'time'
require 'logwrapper'

module Rack
  module Logwrapper
    class Logger
      def initialize(app, level = ::Logger::INFO)
        @app, @level = app, level
      end

      def call(env)
        logger = ::Logwrapper::Logger.new(env[RACK_ERRORS])
        logger.level = @level

        env[RACK_LOGGER] = logger
        @app.call(env)
      end
    end

    class RequestLogger
      def initialize(app, logger = nil)
        @app = app
        @logger = logger
      end

      def call(env)
        status, headers, body = @app.call(env)
      ensure
        logger = @logger || env[RACK_LOGGER]
        logger.info(nil, create_log(env, status, headers))
      end

      private

      def create_log(env, status, header)
        {
          time: Time.now,
          remote_addr: env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"],
          method: env[REQUEST_METHOD],
          path: env[PATH_INFO],
          query: env[QUERY_STRING],
          status: status.to_i,
        }
      end

    end
  end
end
