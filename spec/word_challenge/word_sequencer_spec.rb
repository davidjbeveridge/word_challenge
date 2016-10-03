$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')

puts $LOAD_PATH
require 'minitest/autorun'
require 'spec_helper'
require 'word_challenge/word_sequencer'

describe WordSequencer do

  describe '#matches' do
    it 'lists sequences with their word of origin' do
      result = WordSequencer.new(['expo']).matches
      assert_equal([['expo', 'expo']], result)
    end

    it 'contains multiple matches for 5-character words' do
      result = WordSequencer.new(['words']).matches
      assert_equal([
        ['ords', 'words'],
        ['word', 'words']
      ], result)
    end

    it 'does not match matches with non-letters' do
      result = WordSequencer.new(['word5']).matches
      assert_equal([['word', 'word5']], result)
    end

    it 'matches capital letters' do
      result = WordSequencer.new(['Words']).matches
      assert_equal([
        ['Word', 'Words'],
        ['ords', 'Words']
      ], result)
    end

    it 'sets duplicate entries to nil' do
      result = WordSequencer.new(['words', 'sword']).matches
      assert_equal([
        ['ords', 'words'],
        ['swor', 'sword'],
        ['word', nil]
      ], result)
    end
  end

  describe '#matching_sequences' do
    it 'contains the sequences for the given words' do
      result = WordSequencer.new(['words']).matching_sequences
      assert_equal(['ords', 'word'], result)
    end

    it 'omits sequences that match multiple words' do
      result = WordSequencer.new(['words', 'sword']).matching_sequences
      assert_equal(['ords', 'swor'], result)
    end
  end

  describe '#matching_words' do
    it 'contains the words with matching sequences' do
      result = WordSequencer.new(['words']).matching_words
      assert_equal(['words', 'words'], result)
    end

    it 'omits words for sequences that match multiple words' do
      result = WordSequencer.new(['words', 'sword']).matching_words
      assert_equal(['words', 'sword'], result)
    end
  end

end
