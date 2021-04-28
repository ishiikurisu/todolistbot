task default: %w[test]

desc "Starts the bot"
task :run do
  ruby 'app/main.rb', './config.yml'
end

desc "Unit tests"
task :test do
  ruby 'test/test.rb'
end
