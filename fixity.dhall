let hlint = ./constructors.dhall

let type = ./Type.dhall

let map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/9f259cd68870b912fbf2f2a08cd63dc3ccba9dc3/Prelude/List/map

let mkFixity = λ(decl : Text) → hlint.fixity { fixity = decl }

let mkFixityList = λ(decls : List Text) → map Text type.Hint mkFixity decls

let arrowFixity =
      mkFixityList
        [ "infixr 3 ***", "infixr 3 &&&", "infixr 2 +++", "infixr 2 |||" ]

let monadFixity = mkFixityList [ "infixr 1 <=<" ]

let composeFixity =
      mkFixityList
        [ "infixr 8 .*"
        , "infixr 8 .**"
        , "infixr 8 .***"
        , "infixr 8 .****"
        , "infixr 8 -.*"
        , "infixr 8 -.**"
        , "infixr 8 -.***"
        , "infixr 8 -.****"
        , "infixl 8 -\$"
        , "infixl 8 ~@~"
        ]

let applicativeFixity =
      mkFixityList
        [ "infixl 4 *>", "infixl 4 <*", "infixl 3 <|>", "infixl 4 <**>" ]

let functorFixity =
      mkFixityList [ "infixl 4 <\$", "infixl 4 \$>", "infixl 1 <&>" ]

in  { mkFixity = mkFixity
    , arrowFixity = arrowFixity
    , monadFixity = monadFixity
    , applicativeFixity = applicativeFixity
    , composeFixity = composeFixity
    , defFixities =
        arrowFixity # monadFixity # functorFixity # applicativeFixity
    }
