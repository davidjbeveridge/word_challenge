class WordChallenge ; module Actions
  class Base
    attr_reader :sequencer, :options

    def initialize(sequencer, options)
      @sequencer = sequencer
      @options = options
    end

    def sequences
      sequencer.matching_sequences.join("\n") + "\n"
    end

    def words
      sequencer.matching_words.join("\n") + "\n"
    end

  end
end ; end
