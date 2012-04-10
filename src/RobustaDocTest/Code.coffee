{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths, Console, Environment} = require "FuellSys"
CoffeeScript = require "coffee-script"
ASTNode = require "./Code/ASTNode"

# exports.compilationResult = 
# compilationResult = (code) ->
#   {
#     clearedCode
#     suiteCode
#   }


exports.compiledSuiteCode = 
compiledSuiteCode = (file, code) ->
  ###
  Clears the comments from tests and adds a `tests` export with all the functions.
  ###

  ast = CoffeeScript.nodes code
  testFunctionCodeByNameMap = {}

  ###
  Fill up the `testFunctionCodeByNameMap` and update the `ast` by clearing the comments
  ###
  for node in ast.expressions
    if ASTNode.isFunction node
      commentNode = ASTNode.functionComment node
      if commentNode?
        throw "Unimplemented"

  
  testCode = 
    Optional.result ((code) -> "exports.tests = \n" + Text.indented 2, code),
      String.optional Strings.interlayedUnion "\n", 
          Map.results(
            (name, code) -> 
              "\"\"\"#{name}\"\"\": -> \n#{Text.indented 2, code}}}"
            testFunctionCodeByNameMap
          )

  ###
  Add test code to the `ast`
  ###
  testAst = CoffeeScript.nodes testCode
  for node in testAst.expressions
    ast.expressions.push node


  ast.compile({filename: file})



