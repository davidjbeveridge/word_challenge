class WordChallenge
  class WordSequencer

    module EnhancedStringScan
      refine String do
        def gscan(pattern)
          (0..size).to_a.reduce([]) do |matches, offset|
            self[offset..-1].match(pattern).tap {|m| matches << m.to_s if m }
            matches
          end
        end
      end
    end

    using EnhancedStringScan

    attr_reader :words

    def initialize(words)
      @words = words
    end

    def matches
      @matches ||= unsorted_matches.sort_by {|pair| pair[0]}
    end

    def matching_sequences
      @matching_sequences ||= unique_matches.map(&:first)
    end

    def matching_words
      @matching_words ||= unique_matches.map(&:last)
    end

    protected

    def unique_matches
      @unique_matches ||= matches.reject{|pair| pair[1].nil?}
    end

    def unsorted_matches
      words.reduce({}) do |hash, word|
        word.gscan(/[A-Za-z]{4}/).each do |seq|
          hash[seq] = hash.key?(seq) ? nil : word
        end
        hash
      end
    end

  end

end
