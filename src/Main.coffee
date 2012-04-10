{Action, Actions, Array, Arrays, Environment, Function, FunctionByLengthMap, FunctionByTypesPairs, FunctionTemplate, Keys, Map, Maps, Number, Numbers, Object, Optional, Optionals, Pair, Pairs, RegExp, Set, SortedArray, String, Strings, Text} = require "Fuell"

RobustaDocTest = require("./RobustaDocTest")


settings = do ->
  args = Array.dropping 2, process.argv

  target:
    if args[0] && String.doesMatch /^[^-]/, args[0] then args[0]
    else "src"
  format:
    Array.containsAnyOf ["--format", "-f"], args


RobustaDocTest.runPath settings.format, settings.target, ->