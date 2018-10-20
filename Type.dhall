    let Error = { error : { lhs : Text, rhs : Text, name : Optional Text } }

in  let Function = { functions : List { name : Text, within : List Text } }

in  let Fixity = { fixity : Text }

in  let Hint = < Error : Error | Functions : Function | Fixity : Fixity >

in  { Error = Error, Function = Function, Fixity = Fixity, Hint = Hint }
