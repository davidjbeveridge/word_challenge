# Word Sequences Challenge

Here is my solution to the [word challenge][word-challenge].

## Installation

You'll need ruby and bundler; then, `bundle install`.

## Usage

The word challenge can be run with `bin/sequencer`. You will need to give it a
file argument for the input.

### Writing output

```sh
# writes output to `output/sequences` and `output/words`
$ bin/sequencer input/dictionary

# optionally, you may specify the output; this will write to
# `output/dictionary_sequences` and `output/dictionary_words`
$ bin/sequencer input/dictionary -o output/dictionary
```

### Verifying output

Additionally, you may use `bin/sequencer` to validate the tool against
existing output.

```
# valid output should be at `output/arrow_words` and `output/arrow_sequences`
$ bin/sequencer input/arrow -v output/arrow
```

## Example input

The `input` directory contains the data specified in the challenge;
`input/arrow` is the input in the example; `input/dictionary` was obtained
from `https://dl.dropboxusercontent.com/u/14065136/dictionary.txt`

## Development

To watch/run specs in development, just run `guard`.

[word-challenge]: https://gist.github.com/codezomb/043e887356b188dae47a
