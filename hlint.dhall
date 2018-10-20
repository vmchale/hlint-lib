    let Error = { error : { lhs : Text, rhs : Text, name : Optional Text } }

in  let Function = { functions : List { name : Text, within : List Text } }

in  let Fixity = { fixity : Text }

in  let Hint =
          constructors
          < Error : Error | Functions : Function | Fixity : Fixity >

in  { fixity = Hint.Fixity, functions = Hint.Functions, error = Hint.Error }
