###
SymbolCode is a declaration code of top level function or class.
###
{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"


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
