require 'yaml'
require 'telegram_bot'

class App
  def initialize config
    @config = config
    @bot = TelegramBot.new token: @config['api_token']
  end

  def run
    puts "# TODO List bot"
    @bot.get_updates do |message|
      puts "---"
      puts "from: @#{message.from.username}"
      puts "message: #{message.text}"
      command = message.get_command_for @bot

      message.reply do |reply|
        case command
        when '/start'
          reply.text = "Hello!"
        else
          reply.text = "Sorry, not implemented yet"
        end
        puts "reply #{reply.text.inspect}"
        reply.send_with @bot
      end
    end
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
