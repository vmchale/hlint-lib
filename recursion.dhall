let hlint = ./constructors.dhall

in  [ hlint.error
        { error =
            { lhs = "hylo embed", rhs = "ana", name = Some "Use ananorphism" }
        }
    , hlint.error
        { error =
            { lhs = "hylo f project"
            , rhs = "cata f"
            , name = Some "Use catamorphism"
            }
        }
    , hlint.error
        { error =
            { lhs = "hyloM (pure . embed)"
            , rhs = "anaM"
            , name = Some "Use monadic anamorphism"
            }
        }
    , hlint.error
        { error =
            { lhs = "hyloM f (pure . project)"
            , rhs = "cataM f"
            , name = Some "Use monadic catamorphism"
            }
        }
    ]
