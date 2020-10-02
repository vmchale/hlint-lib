let hlint = ./constructors.dhall

in  [ hlint.error
        { error = { lhs = "fmap (const x)", rhs = "(x <\$)", name = None Text }
        }
    , hlint.error
        { error =
          { lhs = "fmap (const ())", rhs = "void", name = Some "Use void" }
        }
    , hlint.error
        { error =
          { lhs = "fromMaybe []", rhs = "concat", name = Some "Use concat" }
        }
    ]
