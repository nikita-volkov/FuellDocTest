{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"
{Path, Paths} = require "FuellSys"
CoffeeScript = require "coffee-script"
RobustaTest = require "RobustaTest"
Code = require "./RobustaDocTest/Code"

# exports.compileToSuite = 
# compileToSuite = (file) ->
#   throw "Unimplemented"

exports.runPath = 
runPath = (path, cb) ->
  if Path.fileExists path
    runFiles path, [path], cb
  else if Path.dirExists path
    runFiles path, (Paths.byExtension "coffee", Path.deepPaths path), cb
  else
    throw "Path `#{path}` doesn't exist"

runFiles = (srcDir, files, cb) ->
  suiteByNamePairs = 
    Array.results(
      (p) -> [
        Path.relativeTo srcDir + "/", Path.withoutExtension p
        Map.pairs fileTests p
      ]
      files
    )
  RobustaTest.runSuites suiteByNamePairs, cb
  
fileTests = (file) ->
  code = Path.fileContents file
  code = Code.suiteCode code
  code = CoffeeScript.compile code, {filename: file}
  code = code + "\nreturn exports;"
  Object.member "tests", require.main._compile code