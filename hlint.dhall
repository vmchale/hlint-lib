    let hlint = ./constructors.dhall

in  let recursion = ./recursion.dhall

in  let fixity = ./fixity.dhall

in  let bannedFunctions =
          [ hlint.functions
            { functions = [ { name = "fromJust", within = [] : List Text } ] }
          ]

in  fixity.defFixities # bannedFunctions # recursion
