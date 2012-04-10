{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
Node = require "./AST/Node"


exports.commentedDeclarationNodes = 
commentedDeclarationNodes = (ast) ->
  throw "Unimplemented: not filtered yet"
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





# exports.commentNodes =
# commentNodes = (ast) ->
#   functionsComments = 
#     Array.results Node.functionComment, 
#       Array.matches Node.isFunction, ast.expressions
#   classes = 
#     Array.matches Node.isClass, ast.expressions
#   classesAndMethodsComments = 
#     Arrays.union Array.results(
#       (cn) -> 
#         classComment = Node.classComment cn
#         Array.prepending classComment, 
#           Array.results Node.functionComment, 
#             Node.classMethods cn
#       classes
#     )
#   Arrays.union [functionsComments, classesAndMethodsComments]



# exports.convertToSuite = 
# convertToSuite = (ast) ->
#   ###
#   Clears the comments from tests and adds a `tests` export with all the functions.
#   ###
#   throw "Unimplemented"

#   return


# {Path} = require "FuellSys"
# CoffeeScript = require "coffee-script"

# ast = CoffeeScript.nodes Path.fileContents "sample-project/SomeModule.coffee"

# # ds = declarations(ast)
# # ast.traverseChildren false, (n) ->
# #   console.log n if n in ds


# testCode = 
#   """
#   exports.tests = 
#     "codeByNamePairs": ->
#       @equals(
#         [ [ 'asd', "sldkfj\\nsdlfkjsd\\nsdlfkjs d" ],
#           [ 'dslkfj', 'dslfkjdskfj' ] ]
#         codeByNamePairs \"\"\"
#           - asd
#             sldkfj
#             sdlfkjsd
#             sdlfkjs d
#           - dslkfj
#             dslfkjdskfj
#         \"\"\"
#       )
#       @isNull codeByNamePairs "sdf\\n- dslfjk"
#   """

# testAst = CoffeeScript.nodes testCode

# ast.expressions.push node for node in testAst.expressions


# console.log commentNodes ast

# # console.log ast.compile()
