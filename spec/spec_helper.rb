# Find missing constants in the WordChallenge namespace:

def Object.const_missing(c)
  if WordChallenge.const_defined? c
    WordChallenge.const_get(c)
  else
    raise NameError, "uninitialized constant #{c}"
  end
end
