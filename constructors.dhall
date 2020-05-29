let type =
      ./Type.dhall sha256:412be9fbfbb4806896de0accbc5f6b62cd307dabdaaf431e3afb09c1e8fc3e86

let globalBan = λ(fun : Text) → { name = fun, within = [] : List Text }

in  { fixity = type.Hint.Fixity
    , functions = type.Hint.Functions
    , error = type.Hint.Error
    , globalBan
    }
