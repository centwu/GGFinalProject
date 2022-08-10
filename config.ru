# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require_relative "./rack_logwrapper_logger.rb"

use Rack::Logwrapper::Logger
use Rack::Logwrapper::RequestLogger

run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']] }

run Rails.application
Rails.application.load_server
