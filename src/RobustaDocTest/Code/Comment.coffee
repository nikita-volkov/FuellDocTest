{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"


TestsText

exports.parsing = 
parsing = (comment) ->
  ###
  # `comment` is expected to include the hashes
  # `comment` is expected to be trimmed and unindented
  `comment` is expected to be everything between opening and closing hashes. This includes whitespace and linebreaks.
  ###
  {textBeforeTests, testsText, textAfterTests} = parts comment
  {testCodeByNamePairs, singleTestCode} = TestsText.parsing testsText
  {
    clearedComment: textBeforeTests + textAfterTests
    singleTestCode
    testCodeByNamePairs
  }

parts = (comment) ->
  indentation = Text.indentation

  r = {}

  currentGroup = "textBeforeTests"
  for line in Text.lines comment
    switch currentGroup
      when "textBeforeTests"
        if "TESTS:" == String.trimmed line
          currentGroup = "testsText"
          continue
      when "testsText"
        if indentation == String.indentation line
          currentGroup = "textAfterTests"

    if currentGroup of r 
      r[currentGroup] += line
    else
      r[currentGroup] = line

  r

# parts = (comment) ->
#   indentation = Text.indentation

#   currentGroup = "textBeforeTests"
#   for line in Text.lines comment
#     switch currentGroup
#       when "textBeforeTests":
#         if "TESTS:" == String.trimmed line
#           currentGroup = "testsText"
#         else 
#           textBeforeTests += line
#       when "testsText":
#         if indentation == String.indentation line
#           currentGroup = "textAfterTests"
#           textAfterTests += line
#         else
#           testsText += line
#       when "textAfterTests":
#         textAfterTests += line

#   {textBeforeTests, testsText, textAfterTests}



  # lineGroups = 
  #   Array.leftReduction(
  #     (r, line) ->
  #       if not hasKey "testsText", r
  #         if "TESTS:" == String.trimmed line
  #           r

  #       if indentation == String.indentation line
  #     Text.lines comment
  #   )
  # unindented = Text.unindented comment
  # Text.lines
  # String.extracts /^(.*)

  ###
  text before

  TESTS:
    comment = """
        asldfja;sld
        sdlfkje
        TESTS:
          - test 1
            some code
            blablabla
          - test 2
            asdf
    """
    testsCo
  text after
  ###




