    let hlint = ./constructors.dhall

in  [ hlint.error
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
    , hlint.error
      { error =
          { lhs =
              "hyloM (pure . embed)"
          , rhs =
              "anaM"
          , name =
              [ "Use monadic anamorphism" ] : Optional Text
          }
      }
    , hlint.error
      { error =
          { lhs =
              "hyloM f (pure . project)"
          , rhs =
              "cataM f"
          , name =
              [ "Use monadic catamorphism" ] : Optional Text
          }
      }
    ]
