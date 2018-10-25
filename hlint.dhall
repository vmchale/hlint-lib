    let hlint =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/constructors.dhall

in  let recursion =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/recursion.dhall

in  let fixity =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/fixity.dhall

in  let bannedFunctions =
          [ hlint.functions { functions = [ hlint.globalBan "fromJust" ] } ]

in  fixity.defFixities # bannedFunctions # recursion
