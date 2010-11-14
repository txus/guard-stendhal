module Guard
  class Stendhal
    module Runner
      class << self
        
        def run(paths, options = {})
          message = options[:message] || "Running: #{paths.join(' ')}"
          UI.info message, :reset => true
          system(stendhal_command(paths, options))
        end
        
      private
        
        def stendhal_command(paths, options = {})
          cmd_parts = []
          cmd_parts << "bundle exec" if bundler? && options[:bundler] != false
          cmd_parts << "stendhal"
          cmd_parts << paths.join(' ')
          cmd_parts.flatten.compact.reject(&:empty?).join(" ")
        end
        
        def bundler?
          @bundler ||= File.exist?("#{Dir.pwd}/Gemfile")
        end
        
      end
    end
  end
end
