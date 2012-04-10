{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths} = require "FuellSys"
CoffeeScript = require "coffee-script"
RobustaTest = require "RobustaTest"
Code = require "./RobustaDocTest/Code"

# exports.compileToSuite = 
# compileToSuite = (file) ->
#   throw "Unimplemented"


exports.runPath = 
runPath = (format, path, cb) ->
  if Path.fileExists path
    runFiles format, path, [path], cb
  else if Path.dirExists path
    runFiles format, path, (Paths.byExtension "coffee", Path.deepPaths path), cb
  else
    throw "Path `#{path}` doesn't exist"

runFiles = (format, srcDir, files, cb) ->
  suiteByNamePairs = 
    Array.results(
      (p) -> 
        tests = fileTests p
        if tests
          [
            Path.relativeTo srcDir + "/", Path.withoutExtension p
            Map.pairs tests
          ]
      files
    )

  RobustaTest.runSuites format, suiteByNamePairs, cb
  
fileTests = (file) ->
  code = Path.fileContents file
  code = Code.suiteJSCode file, code

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