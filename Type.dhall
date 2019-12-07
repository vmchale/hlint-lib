let Error = { error : { lhs : Text, rhs : Text, name : Optional Text } }

let Function = { functions : List { name : Text, within : List Text } }

let Fixity = { fixity : Text }

let Hint = < Error : Error | Functions : Function | Fixity : Fixity >

in  { Error = Error, Function = Function, Fixity = Fixity, Hint = Hint }
