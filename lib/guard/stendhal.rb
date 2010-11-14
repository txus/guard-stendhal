require 'guard'
require 'guard/guard'

module Guard
  class Stendhal < Guard
    
    autoload :Runner, 'guard/stendhal/runner'
    autoload :Inspector, 'guard/stendhal/inspector'
    
    def run_all
      Runner.run [""], options.merge(:message => "Running all specs")
    end
    
    def run_on_change(paths)
      paths = Inspector.clean(paths)
      Runner.run(paths, options) unless paths.empty?
    end
    
  end
end
