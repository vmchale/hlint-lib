    let Error = { error : { lhs : Text, rhs : Text, name : Optional Text } }

in  let Function = { functions : List { name : Text, within : List Text } }

in  let Fixity = { fixity : Text }

in  let Hint =
          constructors
          < Error : Error | Functions : Function | Fixity : Fixity >

in  let fixities =
          [ Hint.Fixity { fixity = "infixr 3 ***" }
          , Hint.Fixity { fixity = "infixr 3 &&&" }
          , Hint.Fixity { fixity = "infixr 1 <=<" }
          ]

in  let bannedFunctions =
          [ Hint.Functions
            { functions = [ { name = "fromJust", within = [] : List Text } ] }
          ]

in  let rewrites =
          [ Hint.Error
            { error =
                { lhs =
                    "hylo embed"
                , rhs =
                    "ana"
                , name =
                    [ "Use ananorphism" ] : Optional Text
                }
            }
          , Hint.Error
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
