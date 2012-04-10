{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"


exports.codeByNamePairs = 
codeByNamePairs = (text) ->
  ###
  TESTS:
    @equals(
      [ [ 'asd', 'sldkfj\nsdlfkjsd\nsdlfkjs d' ],
        [ 'dslkfj', 'dslfkjdskfj' ] ]
      codeByNamePairs """
        - asd
          sldkfj
          sdlfkjsd
          sdlfkjs d
        - dslkfj
          dslfkjdskfj
      """
    )
    @isNull codeByNamePairs "sdf\n- dslfjk"
  ###
  lines = Text.lines text

  codeByNamePair = (lines) ->
    [
      String.firstExtract /^- (.*):?$/, Array.first lines
      do ->
        codeLines = Array.allButFirst lines
        indentation = String.indentation Array.first codeLines
        unindentedLines = 
          for line in codeLines
            if String.doesMatch /^\s*$/, line then ""
            else 
              r = String.remainder indentation, line
              if r? then r
              else 
                throw "Incorrectly indented line: #{line}"
        Strings.interlayedUnion "\n", unindentedLines
    ]

  if String.startsWith "- ", Array.first lines
    Array.results codeByNamePair, 
      Array.groupsWithHeadings [String.startsWith, "- "], lines
  
# console.log codeByNamePairs """
#         - asd
#           sldkfj
#           sdlfkjsd
#           sdlfkjs d
#         - dslkfj
#           dslfkjdskfj
#       """