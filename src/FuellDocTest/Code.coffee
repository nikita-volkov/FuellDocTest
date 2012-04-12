{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
CoffeeScript = require "coffee-script"
ASTNode = require "./Code/ASTNode"
Comment = require "./Code/Comment"


exports.suiteJSCode = 
suiteJSCode = (file, code) ->
  ###
  Clears the comments from tests and adds a `tests` export with all the functions.
  ###
  ast = CoffeeScript.nodes code

  testCodeByNamePairs = []

  ###
  Fill up the `testCodeByNamePairs` and update the `ast` by clearing the comments
  ###
  processCommentNode = (parentName, commentNode) ->
    parsing = Comment.parsing commentNode.comment

    if parsing.singleTestCode
      testCodeByNamePairs.push [parentName, parsing.singleTestCode]
    if parsing.testCodeByNamePairs
      for [name, code] in parsing.testCodeByNamePairs
        testCodeByNamePairs.push ["#{parentName}: #{name}", code]

    commentNode.comment = parsing.text

  for node in ast.expressions
    if ASTNode.isFunction node
      name = ASTNode.name node
      commentNode = ASTNode.functionComment node
      if commentNode?
        processCommentNode name, commentNode
    else if ASTNode.isClass node
      commentNode = ASTNode.classComment node
      className = ASTNode.name node
      if commentNode?
        processCommentNode className, commentNode
      for node in ASTNode.classMethods node
        methodName = ASTNode.name node
        commentNode = ASTNode.functionComment node
        if commentNode?
          processCommentNode className + "." + methodName, commentNode

  testCode = do ->
    functionCodes = 
      for [name, code] in testCodeByNamePairs
        "\"#{name}\": -> \n#{Text.indented 2, code}"

    if functionCodes.length > 0
      "exports.tests = \n" + 
      Text.indented 2, Strings.interlayedUnion "\n", functionCodes
    else ""
  
  if testCode
    ###
    Add test code to the `ast`
    ###
    testAst = CoffeeScript.nodes testCode
    for node in testAst.expressions
      ast.expressions.push node

    ast.compile {filename: file}
  else ""


# {Path, Paths, Console, Environment} = require "FuellSys"
# file = "sample-project/SomeModule.coffee"
# console.log suiteJSCode file, Path.fileContents file