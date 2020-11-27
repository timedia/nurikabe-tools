# frozen_string_literal: true

require 'optparse'
require 'yaml'

require_relative 'version'

module Nurikabe
  module GenerateIgnorelist
    class Command
      def initialize(args)
        # set default values
        @path = File.expand_path('../../../config/default.yaml', __dir__)
        @separator = ','

        rest = option_parser.parse(args)
        return if rest.empty?

        warn option_parser.help
        exit 1
      end

      def call
        File.open(@path, 'r') do |file|
          YAML
            .safe_load(file, symbolize_names: true)
            .flat_map { |group| group[:enabled] ? group[:urls] : [] }
            .sort_by { |v| v.delete_prefix('*.') }
            .uniq
            .join(@separator)
        end
      end

      private

      def option_parser
        @option_parser ||= OptionParser.new do |opts|
          opts.on(
            '-f',
            '--file=FILE',
            'Specify the yaml file name of the ignorelist definition. default: config/default.yaml'
          ) { |path| @path = path }
          opts.on('-s', '--separator=SEP', 'Specify the separator charactor.') { |separator| @separator = separator }
          opts.version = VERSION
        end
      end
    end
  end
end
