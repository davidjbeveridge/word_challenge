require 'optparse'

class WordChallenge
  class Options
    def initialize
      @options = {}
      @parsed = false
    end

    def parse!
      return if @parsed
      parser.parse!
    end

    def argf
      parse!
      ARGF.each_line.map(&:chomp)
    end

    DEFINITIONS = {
      output: ['-oOUTPUT', '--output=OUTPUT', 'Output file name'],
      verify: ['-vFILE', '--verify=FILE', 'Verify program agains existing output for comparison']
    }

    def method_missing(name, *args, &block)
      return @options[name] if DEFINITIONS.has_key?(name)
      super
    end

    protected

    def parser
      OptionParser.new do |p|
        DEFINITIONS.each do |key, cli_hooks|
          p.on(*cli_hooks) { |o| @options[key] = o}
        end
      end
    end
  end
end

