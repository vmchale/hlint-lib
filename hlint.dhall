let hlint =
      ./constructors.dhall sha256:6cd39e2ebb8441aeccd76088ee1e631a1f571ca85de9319b21fdf6ff7c6e17e4

let recursion =
      ./recursion.dhall sha256:ab1f31137bc10536826df8c55ce7b960c1df16c6c3663efde16d3bd7acf58f49

let fixity =
      ./fixity.dhall sha256:790a07ca801347ce8dafaa1dd0588dc7540b5987264381926900bf1316ea6cbc

let base = ./base.dhall

let bannedFunctions =
      [ hlint.functions { functions = [ hlint.globalBan "fromJust" ] } ]

in  fixity.defFixities # bannedFunctions # recursion # base
