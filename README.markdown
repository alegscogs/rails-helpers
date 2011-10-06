Alegscogs Helpers
-----------------

These are some rails views helpers that I've found useful.

Phrasify
--------

Takes collections of strings and arrays of strings as arguments, and tries to output meaningful phrases.

This is particularly useful when you have dynamic content that has to be rendered in well-constructed phrases.


    phrasify 'on', 'jan 4th'
    # => 'on jan 4th'
    
    phrasify 'on', ['jan 4th']
    # => 'on jan 4th'
    
    phrasify 'on', ['jan 4th', 'dec 8th'] 
    # => 'on jan 4th and dec 8th'
    
    phrasify 'on', ['jan 4th', 'dec 8th', 'march 20th'] 
    # => 'on jan 4th, dec 8th, and march 20th'
    
    phrasify ['on', 'between'], ['jan 4th']             
    # => 'on jan 4th'
    
    phrasify ['on', 'between'], ['jan 4th', 'dec 8th']  
    # => 'between jan 4th and dec 8th'

Phrasify invokes rails' Array#to_sentence, and takes its options: 

    phrasify 'on', ['jan 4th', 'dec 8th'], {:last_word_connector => ' or ', :two_words_connector => ' or '}
    # => 'on jan 4th or dec 8th'
    
    phrasify ['on', 'on either'], ['jan 4th', 'dec 8th', 'march 20th'], {:last_word_connector => ' or ', :two_words_connector => ' or '}
    # => 'on either jan 4th, dec 8th, or march 20th'

Nested arrays will be exploded and passed recursively as arguments:

    phrasify 'on', ['jan 4th', [['on the morning of', 'on the mornings of'], ['jan 5th', 'jan 6th']]] 
    # => 'on jan 4th and on the mornings of jan 5th and jan 6th'

An introductory string followed by an empty array returns nil, or gets ignored in the case of nested arguments:

    phrasify 'on', []
    # => nil

    phrasify 'on', ['jan 4th', []]
    # => 'on jan 4th'

When phrasify is passed a single array, optionally followed by an options hash, after attempting to resolve any nested phrases, it will invoke #to_sentence on the resulting array of strings.  In this case, passing a :join option will cause Array#join to be used instead of Array#to_sentence, with the value of the join option passed as parameters to the join call.

    use_or = {:last_word_connector => ' or ', :two_words_connector => ' or '}
    phrasify( [
      'Sorry!  There are no search results for', 
      [['Theater', 'Art & Entertainment'], use_or], 
      'events', 
      [['on', 'between'], ['jan 4th', 'jan 15th']],
      ['that', [
          ['are good for', [], use_or],
          ['happen in the', ['morning', 'afternoon'], use_or],
          ['cost', [], use_or]
        ]],
    ], {:join => ' '}) 
    # => 'Sorry!  There are no search results for Theater or Art & Entertainment 
    #     events between jan 4th and jan 15th that happen in the morning or afternoon'
      

Copyright (c) October 6 2011, by Alex Cox 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
