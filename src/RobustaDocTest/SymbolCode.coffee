{Action, Actions, Array, Arrays, Environment, Function, Keys, Map, Number, Object, Optional, Pair, Pairs, RegExp, Set, SortedArray, String, Strings} = require "../FueL"


exports.parsing = 
parsing = (code) ->
  {heading, comment, content} = parts code
  theName = name code
  {clearedComment, singleTestCode, testCodeByNamePairs} = Comment.parsing comment
  {
    clearedCode:
      "#{heading}####{clearedComment}####{content}"
      # String.prepending heading,
      #   String.appending content,
      #     Text.indented (String.length String.indentation content),
      #       "###\n#{text}\n###\n"
    testCodeByNamePairs:
      if testCodeByNamePairs 
        Array.results (([k, v]) -> ["#{theName}: #{k}", v]), testCodeByNamePairs
      else if singleTestCode
        [[theName, singleTestCode]]
  }



parts = (code) ->

name = (code) ->
