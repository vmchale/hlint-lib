    let hlint =
          https://github.com/vmchale/hlint-lib/releases/download/0.1.0/constructors.dhall_i

in  let recursion =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/recursion.dhall

in  let fixity =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/fixity.dhall

in  let bannedFunctions =
          [ hlint.functions { functions = [ hlint.globalBan "fromJust" ] } ]

in  fixity.defFixities # bannedFunctions # recursion
