{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"


MultipleTestsText = require "./TestsText/MultipleTestsText"

exports.parsing = 
parsing = (text) ->
  ###
  `text` is everything in the "TESTS:" block

  TESTS:
    - single test:
      @equals(
        {singleTestCode: "line1\nline2"}
        parsing """
          line1
          line2
        """
      )
    - multiple named tests and empty tests:
      @equals(
        { testCodeByNamePairs: 
           [ [ 'test 1', 'line1\nline2' ],
             [ 'test 2', '' ],
             [ 'test 3', 'a' ] ] }
        parsing """
          - test 1
            line1
            line2
          - test 2
          - test 3
            a
        """
      )
    - empty text:
      @isNull parsing "  \n  "
  ###
  if not String.doesMatch /^\s*$/, text
    text = Text.unindented Text.trimmed text
    if (r = MultipleTestsText.codeByNamePairs text)? 
      {testCodeByNamePairs: r}
    else {singleTestCode: text}


