# frozen_string_literal: true

require 'rake'
Rake::TaskManager.record_task_metadata = true

module Rake
  class TUI
    class << self
      # Singleton instance (if argument is specified, it is used to set instance)
      def instance(tui=nil)
        if tui.nil?
          @instance ||= new
        else
          @instance = tui
        end
      end
      
      # Run TUI (recommended for general use)
      def run
        instance.run
      end
    end
    
    # Initialize a new TUI object
    def initialize(tasks=Rake.application.tasks)
      if tasks.empty?
        Rake.application.init
        Rake.application.load_rakefile
        tasks = Rake.application.tasks
      end
      
      tasks = tasks.reject {|task| task.comment.nil?}

      max_task_size = !tasks.empty? && (tasks.map(&:name_with_args).map(&:size).max + 1)
      @rake_task_lines = tasks.map do |task| 
        "rake #{task.name_with_args.ljust(max_task_size)} # #{task.comment}"
      end
    end
  
    # Run TUI
    def run  
      version = File.read(File.expand_path('../../../../../VERSION', __FILE__)).strip
      puts "== rake-tui version #{version} =="
          
      unless @rake_task_lines&.detect {|l| l.start_with?('rake ')}
        puts "No Rake tasks found!"
        puts "Exiting..."
        exit(0)
      end  
      
      require 'tty-prompt'
      
      prompt = TTY::Prompt.new
      
      prompt.on(:keyescape) do |event|
        puts # a new line is needed
        puts "Exiting..."
        exit(0)
      end
      
      begin
        rake_task_lines = @rake_task_lines.map do |line| 
          bound = TTY::Screen.width - 6
          line.size <= bound ? line : "#{line[0..(bound - 3)]}..."
        end
        rake_task_line = prompt.select("Choose a Rake task: ", rake_task_lines, cycle: true, per_page: [TTY::Screen.height - 5, 1].max, filter: true, show_help: :always, help: "(Press ↑/↓ arrow to move, Enter to select, CTRL+Enter to run without arguments, and letters to filter)") do |list|
          list.singleton_class.define_method(:keyspace) do |event|
            return unless filterable?
      
            if event.value = " "
              @filter << event.value
              @active = 1
            end
          end
        end
        
        rake_task_with_args = rake_task_line.split('#').first.strip.split[1]
        rake_task, rake_task_arg_names = rake_task_with_args.sub(']', '').split('[')
        rake_task_arg_names = rake_task_arg_names&.split(',').to_a
        rake_task_arg_values = rake_task_arg_names.map do |rake_task_arg_name|
          prompt.ask("Enter [#{rake_task_arg_name}] (default=nil):")
        end
        Rake::Task[rake_task].invoke(*rake_task_arg_values) # TODO support args
      rescue TTY::Reader::InputInterrupt => e
        # No Op
        puts # a new line is needed
        puts "Exiting..."
        exit(0)
      end  
    end
  end
end
