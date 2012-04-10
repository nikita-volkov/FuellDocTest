someFunctionCall()

justAVar

unexportedFunction = ->

###
Some outer comment
###

# a class
class SomeClass
  ###
  Doccomment
  ###
  constructor: ->
    ###
    comment on constructor
    ###
  meth: ->
    ###doc###
    return
  staticFunc = ->
    ###doc###

exports.abc = abc = (arg) ->
  ###
  Doccomment
  ###
  "nothing"



exports.codeByNamePairs = 
codeByNamePairs = (text) ->
  ###
  TESTS:
    @equals(
      [ [ 'asd', 'sldkfj\nsdlfkjsd\nsdlfkjs d' ],
        [ 'dslkfj', 'dslfkjdskfj' ] ]
      codeByNamePairs """
        - asd
          sldkfj
          sdlfkjsd
          sdlfkjs d
        - dslkfj
          dslfkjdskfj
      """
    )
    @isNull codeByNamePairs "sdf\n- dslfjk"
  ###
  # some code follows


justAValue = "sdlkfj"