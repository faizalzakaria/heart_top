# frozen_string_literal: true

require 'heart_top/agent'
require 'getoptlong'
require 'terminal-table'
require 'rainbow'
require 'dante'

module HeartTop
  class CLI
    attr_accessor :verbose, :interval

    class UnsupportedCommand < StandardError; end

    class << self
      def run
        begin
          parse_args!
        rescue UnsupportedCommand => e
          print_error(e.message)
          exit
        end
        set_defaults
        print_details
        execute
      end

      private

      def execute!
        send("#{@command}!")
      end

      def pid_path
        '/tmp/heartop.pid'
      end

      def log_path
        '/tmp/hearttop.log'
      end

      def start
        options = {
          interval: @interval,
          verbose: @verbose
        }
        Dante::Runner
          .new('hearttop')
          .execute(daemonize: true, pid_path: pid_path, log_path: log_path) do |_opts|
          HeartTop::Agent.new(options).run
        end
      end

      def stop
        Dante::Runner
          .new('hearttop')
          .execute(kill: true, pid_path: pid_path)
      end

      def set_defaults
        @interval ||= 10
        @verbose  ||= false
      end

      def parse_args!
        opts = GetoptLong.new(['--help', '-h', GetoptLong::NO_ARGUMENT],
                              ['--interval', '-i', GetoptLong::REQUIRED_ARGUMENT],
                              ['--verbose', '-v', GetoptLong::NO_ARGUMENT])
        @interval = nil
        @verboes  = nil
        opts.each do |opt, arg|
          case opt
          when '--help'
            print_help
          when '--interval'
            @interval = arg
          when '--verbose'
            @verbose = true
          end
        end
        @command = ARGV.shift
        return if supported_commands?(@command)
        raise UnsupportedCommand, Rainbow('Unsupported command detected, ').red + Rainbow(@command).green
      end

      def supported_commands?(cmd)
        cmd.nil? || %w[stop start].include?(cmd)
      end

      def print_details
        return unless @verbose
        table = Terminal::Table.new do |t|
          t << [Rainbow('verbose').green, Rainbow(@verbose).green]
          t.add_row [Rainbow('interval').green, Rainbow(@interval).green]
          t.add_row [Rainbow('command').green, Rainbow(@command).green]
        end
        puts table
      end

      def print_error(msg)
        puts Rainbow(msg).red
      end

      def print_help
        puts <<~EOF
          heartbeat [OPTION]
           --help, -h:
             show help
           --interval [interval], -i [interval]:
             interval, e.g: 10 (in seconds)

      EOF
      end
    end
  end
end
