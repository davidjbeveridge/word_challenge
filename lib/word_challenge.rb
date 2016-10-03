require 'word_challenge/word_sequencer'
require 'word_challenge/actions'

class WordChallenge

  def initialize(dictionary, options={})
    @sequencer = WordSequencer.new(dictionary)
    @options = options
  end

  def call
    action.()
  end

  protected

  attr_reader :options, :sequencer

  def action
    (options.verify ?
     Actions::VerifySolution :
     Actions::WriteSolution
    ).new(sequencer, options)
  end

end
