let type = ./Type.dhall

in  let globalBan = λ(fun : Text) → { name = fun, within = [] : List Text }

    in  { fixity =
            type.Hint.Fixity
        , functions =
            type.Hint.Functions
        , error =
            type.Hint.Error
        , globalBan =
            globalBan
        }
