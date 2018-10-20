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

in  { fixity = Hint.Fixity, functions = Hint.Functions, error = Hint.Error }
