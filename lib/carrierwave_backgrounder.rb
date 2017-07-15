require 'active_support/core_ext/object'
require 'backgrounder/orm/base'
require 'backgrounder/delay'

module CarrierWave
  module Backgrounder
  end
end

require 'backgrounder/railtie' if defined?(Rails)
