include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Filtering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Text

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# Don't reload this file for nanoc autocompile. Otherwise, nanoc will eventually
# throw an "ERROR SystemStackError: stack level too deep" exception.
unless defined? LOADED_DEFAULT_CONFIG
  LOADED_DEFAULT_CONFIG = true

  # Compass
  require 'compass'
  Compass.add_project_configuration 'config/compass.config'


  # CoffeeScript
  require 'coffee-script'
  class CoffeeFilter < Nanoc3::Filter
    identifier :coffee

    def run(content, params = {})
      CoffeeScript.compile(content)
    end
  end
end
