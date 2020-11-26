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

        option_parser.parse(args)
      end

      def call
        [@path, @separator]
      end

      private

      def option_parser
        @option_parser ||= OptionParser.new do |opts|
          opts.on('-f', '--file=FILE') { |path| @path = path }
          opts.on('-s', '--separator=SEP') { |separator| @separator = separator }
          opts.version = VERSION
        end
      end
    end
  end
end
