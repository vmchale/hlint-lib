    let type = ./Type.dhall

in  let Hint =
          constructors
          < Error :
              type.Error
          | Functions :
              type.Function
          | Fixity :
              type.Fixity
          >

in  let globalBan = λ(fun : Text) → { name = fun, within = [] : List Text }

in  { fixity =
        Hint.Fixity
    , functions =
        Hint.Functions
    , error =
        Hint.Error
    , globalBan =
        globalBan
    }
