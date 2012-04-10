{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths, Console, Environment} = require "FuellSys"
CoffeeScript = require "coffee-script"
AST = require "./Code/AST"
ASTNode = require "./Code/AST/Node"

# exports.compilationResult = 
# compilationResult = (code) ->
#   {
#     clearedCode
#     suiteCode
#   }


exports.suiteCode = 
suiteCode = (code) ->
  ###
  Clears the comments from tests and adds a `tests` export with all the functions.
  ###
  ast = CoffeeScript.nodes code

  functionsCodes = []
  for node in AST.commentedDeclarationNodes ast
    commentNode = ASTNode.comment node


    # functionsCodes.push Comment.functionCode (ASTNode.name node), commentNode.comment
    commentNode.comment = Comment.cleared commentNode.comment




  ASTNode.name ast

  AST.commentedDeclarationNodes ast

  throw "Unimplemented: Code.suiteCode"

# symbolCodes = (code) ->
  


AST = require "./Code/AST"
