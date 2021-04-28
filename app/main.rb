require 'yaml'

class App
  def initialize config
    @config = config
  end

  def run
  end
end

if __FILE__ == $PROGRAM_NAME
  config = YAML.load(File.open(ARGV[0], 'r').read)
  app = App.new config
  begin
    app.run
  rescue Interrupt => e
    puts 'Program interrupted'
  end
end
