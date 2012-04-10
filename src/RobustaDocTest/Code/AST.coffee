{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths, Console, Environment} = require "FuellSys"
CoffeeScript = require "coffee-script"

Node = require "./AST/Node"


exports.declarations = 
declarations = (ast) ->
  functions = 
    Array.matches Node.isFunction, ast.expressions
  classes = 
    Array.matches Node.isClass, ast.expressions
  classesAndMethods = 
    Arrays.union Array.results(
      (cn) -> Object.before (Node.classMethods cn), cn
      classes
    )
  Arrays.union [functions, classesAndMethods]



exports.convertToSuite = 
convertToSuite = 


{Path} = require "FuellSys"
CoffeeScript = require "coffee-script"

ast = CoffeeScript.nodes Path.fileContents "sample-project/SomeModule.coffee"

# ds = declarations(ast)
# ast.traverseChildren false, (n) ->
#   console.log n if n in ds

# console.log declarations(ast)[0].compileNode()

console.log ast.compile()
