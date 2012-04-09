{Action, Actions, Array, Arrays, Environment, Function, Keys, Map, Number, Object, Optional, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "../../../FueL"

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
      groupsWithHeadings [String.startsWith, "- "], lines
  
groupsWithHeadings = Function.composable (p, xs) ->
  ###
  TESTS:
    @equals [[1,2,3],[1,6]], 
      groupsWithHeadings ((x) -> x == 1), [1,2,3,1,6]
  ###
  Array.leftReduction(
    (r, x) -> 
      if p x
        Array.appending [x], r
      else if r.length > 0
        Array.appending(
          Array.appending x, Array.last r
          Array.allButLast r
        )
      else throw "Input doesn't begin with header"
    []
    xs
  )

console.log codeByNamePairs "sdf\n- dslfjk"