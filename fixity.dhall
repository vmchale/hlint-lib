let hlint =
      ./constructors.dhall sha256:6cd39e2ebb8441aeccd76088ee1e631a1f571ca85de9319b21fdf6ff7c6e17e4

let type =
      ./Type.dhall sha256:412be9fbfbb4806896de0accbc5f6b62cd307dabdaaf431e3afb09c1e8fc3e86

let map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/9f259cd68870b912fbf2f2a08cd63dc3ccba9dc3/Prelude/List/map sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

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

in  { mkFixity
    , arrowFixity
    , monadFixity
    , applicativeFixity
    , composeFixity
    , defFixities =
        arrowFixity # monadFixity # functorFixity # applicativeFixity
    }
