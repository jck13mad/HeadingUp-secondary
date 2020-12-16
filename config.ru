require_relative './config/env'
use Rack::MethodOverride

use BagItemController
use HeadsController
use UserController
run ApplicationController