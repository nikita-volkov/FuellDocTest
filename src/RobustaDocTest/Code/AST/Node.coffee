{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"

exports.type = 
type = (n) -> 
  n.constructor.name
  
# exports.hasType = 
# hasType = (t, n) -> t == n.constructor.name

exports.value = 
value = (n) ->
  if n.value?.value then value n.value
  else n.value

exports.name = 
name = (n) ->
  throw "Unimplemented: Node.name"


exports.isFunction = 
isFunction = (n) ->
  if "Assign" == type n
    if "Code" == type n.value then true
    else isFunction n.value
  else false

exports.isClass = 
isClass = (n) ->
  "Class" == type n

# exports.isDeclaration = 
# isDeclaration = (n) ->
#   isFunction(n) || isClass(n)


exports.classMethods = 
classMethods = (n) ->
  ###
  non static members of a class
  ###
  Array.matches isFunction, n.body.expressions[0]?.base?.objects ? []


exports.classComment = 
classComment = (n) ->
  Object.optional ((n) -> n?.comment?), n.body.expressions[0]?.base?.objects[0]

exports.functionComment = 
functionComment = (n) ->
  ###
  Works on both functions and methods
  ###
  Object.optional ((n) -> n?.comment?), value(n).body?.expressions[0]

exports.comment =
comment = (n) ->
  if isClass n then classComment n
  else if isFunction then functionComment n


# exports.commentText = 
# commentText = (n) ->
#   comment(n)?.comment

# exports.setCommentText = 
# setCommentText = (text, n) ->
#   comment(n).comment ?= text



# {Path, Console} = require "FuellSys"
# CoffeeScript = require "coffee-script"
# ast = CoffeeScript.nodes Path.fileContents "sample-project/SomeModule.coffee"

# # console.log "must be false:"
# # console.log isFunction ast.expressions[0]
# # console.log isFunction ast.expressions[1]
# # console.log isFunction ast.expressions[4]
# # console.log isFunction ast.expressions[7]
# # console.log "must be true:"
# # console.log isFunction ast.expressions[2]
# # console.log isFunction ast.expressions[5]
# # console.log isFunction ast.expressions[6]

# n = ast.expressions[4]
# # Console.log Array.member 0, classMethods n
# Console.log functionComment Array.member 0, classMethods n
# # Console.log ast.expressions[5]
# Console.log functionComment ast.expressions[5]