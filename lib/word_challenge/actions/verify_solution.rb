class WordChallenge ; module Actions
  class VerifySolution < Actions::Base
    def call
      compare(test_sequences, sequences)
      compare(test_words, words)
      puts "Looks good."
    end

    protected

    def read(path)
      File.read path rescue nil
    end

    def test_sequences
      read "#{options.verify}_sequences"
    end

    def test_words
      read "#{options.verify}_words"
    end

    def compare(actual, expected)
      unless actual == expected
        puts failure_message(actual, expected)
        exit 1
      end
    end

    def failure_message(actual, expected); <<-EOF
Sorry, but it seems the test output didn't match:

expected:
#{expected.inspect}

actual:
#{actual.inspect}

EOF
    end
  end

end ; end
