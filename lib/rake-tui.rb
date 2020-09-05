$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

version = File.read(File.expand_path('../../VERSION', __FILE__)).strip
puts "== rake-tui version #{version} =="

require 'tty-prompt'

prompt = TTY::Prompt.new

prompt.on(:keyescape) do |event|
  puts # a new line is needed
  puts "Exiting..."
  exit(0)
end

begin
  rake_task_lines = `rake -T`.split("\n")
  unless rake_task_lines.detect {|l| l.start_with?('rake ')}
    puts "No Rake tasks found!"
    puts "Exiting..."
    exit(0)
  end
  rake_task_lines = rake_task_lines.map do |line| 
    bound = TTY::Screen.width - 6
    line.size <= bound ? line : "#{line[0..(bound - 3)]}..."
  end
  rake_task_line = prompt.select("Choose a Rake task: ", rake_task_lines, cycle: true, per_page: [TTY::Screen.height - 5, 1].max, filter: true, help: true, show_help: :always) do |list|
    list.singleton_class.define_method(:keyspace) do |event|
      return unless filterable?

      if event.value = " "
        @filter << event.value
        @active = 1
      end
    end
  end
  rake_task = rake_task_line.split('#').first.strip
  system rake_task
rescue TTY::Reader::InputInterrupt => e
  # No Op
  puts # a new line is needed
  puts "Exiting..."
  exit(0)
end
