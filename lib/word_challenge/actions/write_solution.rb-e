class WordChallenge ; module Actions
  class WriteSolution < Base
    def call
      write sequences_path, sequences
      write words_path, words
    end

    protected

    def write(path, contents)
      File.write path, contents rescue nil
    end

    def sequences_path
      return "#{options.output}_sequences" if options.output
      File.join 'output', 'sequences'
    end

    def words_path
      return "#{options.output}_words" if options.output
      File.join 'output', 'words'
    end

  end
end ; end
