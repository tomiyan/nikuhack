root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

require 'logger'
require ::File.join( root, 'applog' )
logger = ::Logger.new(::File.join( root, 'shared', 'logs','app.log' ))
def logger.write(msg)
    self << msg
end

use AppLog, logger
use Rack::CommonLogger, logger

run App.new
