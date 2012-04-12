{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths} = require "FuellSys"
CoffeeScript = require "coffee-script"
FuellTest = require "FuellTest"
Code = require "./FuellDocTest/Code"

# exports.compileToSuite = 
# compileToSuite = (file) ->
#   throw "Unimplemented"


exports.runPath = 
runPath = (pretty, path, cb) ->
  if Path.fileExists path
    runFile pretty, path, cb
  else if Path.dirExists path
    runDir pretty, path, cb
  else
    throw "Path `#{path}` doesn't exist"

runFile = (pretty, file, cb) ->
  testByNameMap = Map.pairs fileTests file
  FuellTest.runSuite pretty, "Docs of `#{file}`", testByNameMap, cb

runDir = (pretty, dir, cb) ->
  files = Paths.byExtension "coffee", Path.deepPaths dir
  suiteByNamePairs = 
    Array.results(
      (p) -> 
        tests = fileTests p
        if tests
          [
            Path.relativeTo dir + "/", Path.withoutExtension p
            Map.pairs tests
          ]
      files
    )

  FuellTest.runHarness pretty, "Docs of `#{dir}`", suiteByNamePairs, cb
  
fileTests = (file) ->
  code = Path.fileContents file
  code = Code.suiteJSCode file, code

  if code.length > 0
    Object.member "tests", jsCodeExports file, code

jsCodeExports = (path, code) ->
  ###
  Fairly stolen from coffeescript
  ###
  code = code + "\nreturn exports;"

  mainModule = require.main

  # Set the filename.
  mainModule.filename = path

  # Clear the module cache.
  mainModule.moduleCache and= {}

  # Assign paths for node_modules loading
  mainModule.paths = require('module')._nodeModulePaths Path.dir path

  mainModule._compile code, mainModule.filename