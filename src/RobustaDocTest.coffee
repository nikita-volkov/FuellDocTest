###
Extracts tests from comments on functions in coffeescript code.

Name all libs with Fuell all bin apps as Robusta

Names:
  csdt
  robusta-doc-test



Advantages:
  - Much less boilerplate. You don't have to care about require paths and maintaining test suites 
  - No fancy naming. All info you need gets generated automatically.
  - Easy execution. Just point to the file you want to run tests in: `fuell-doc-test src/pkg/file.coffee` - or a directory to run tests from all of its files: `coffee-doc-test src`
  . The `node_modules` directory require
  - Allows testing of unexported members

Sample executions:
- `coffee-doc-test src/pkg/file.coffee` will run all tests from file
- `coffee-doc-test src` will run tests in all files in dir
- `coffee-doc-test src/file.coffee target/tests/file.coffee target/clean-sources/file.coffee` saves the appropriate output
- `coffee-doc-test src target/tests target/clean-sources` saves the appropriate output 


OR as a part of robusta compiler or all-in-one robusta project
  robusta src/pkg/file.coffee --run-doc-tests
  robusta src/file.coffee \
          --save-robusta-tests target/robusta-tests/file.coffee \
          --save-clean-code target/clean-code/file.coffee

###
{Action, Actions, Array, Arrays, Environment, Function, Keys, Map, Number, Object, Optional, Pair, Pairs, RegExp, Set, SortedArray, String, Strings} = require "./FueL"



# exports.result = 
# result = (code) ->
#   testCode = ([name, code]) ->
#     String.indented 2, """
#     "#{name}": ->
#       #{String.indented 2, code}
#     """
#   [
#     testCodeByNamePairs
#     clearedCode
#   ]



testCode = ({testCodeByNamePairs, }) ->



firstSymbolCodeExtract = (code) ->
  [
    precedingCode
    symbolCode
    succeedingCode
  ]

symbolData = (symbolCode) ->
  ###
  `symbolCode` is a declaration code of top level function or class.
  ###

  {name, heading, docComment, testByNameMap}

  {heading, comment, content} = symbolCodeParsing symbolCode
  {name} = symbolHeadingParsing heading
  {clearedComment, singleTestCode, multipleTestsCode} = commentParsing comment
  {
    testCodes: 
      testCodes testsCode
    clearedCode:
      heading + clearedComment + content
  }

# testsComment = (comment) ->
#   ###
#   TESTS:
#     comment = """
#         asldfja;sld
#         sdlfkje
#         TESTS:
#           - test 1
#             some code
#             blablabla
#           - test 2
#             asdf
#     """
#     testsCo
#   ###

testCodes = (testsComment) ->
  []

testCode = (testComment) ->


# functionCommentExtract = (code) ->
#   [
#     precedingCode
#     docComment
#     succeedingCode
#   ]



testCodeExtract = (comment) ->
  
  [

  ]
