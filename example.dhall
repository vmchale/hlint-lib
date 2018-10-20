    let hlint = ./hlint.dhall

in  let fixities =
          [ hlint.fixity { fixity = "infixr 3 ***" }
          , hlint.fixity { fixity = "infixr 3 &&&" }
          , hlint.fixity { fixity = "infixr 1 <=<" }
          ]

in  let bannedFunctions =
          [ hlint.functions
            { functions = [ { name = "fromJust", within = [] : List Text } ] }
          ]

in  let rewrites =
          [ hlint.error
            { error =
                { lhs =
                    "hylo embed"
                , rhs =
                    "ana"
                , name =
                    [ "Use ananorphism" ] : Optional Text
                }
            }
          , hlint.error
            { error =
                { lhs =
                    "hylo f project"
                , rhs =
                    "cata f"
                , name =
                    [ "Use catamorphism" ] : Optional Text
                }
            }
          ]

in  fixities # bannedFunctions # rewrites
