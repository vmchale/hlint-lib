# hlint-lib

[![Build Status](https://travis-ci.org/vmchale/hlint-lib.svg?branch=master)](https://travis-ci.org/vmchale/hlint-lib)

Configuration for [hlint](http://hackage.haskell.org/package/hlint), as a Dhall
library.

## Use

As an example:

```dhall
    let hlint =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/constructors.dhall

in  let recursion =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/recursion.dhall

in  let fixity =
          https://raw.githubusercontent.com/vmchale/hlint-lib/master/fixity.dhall

in  let bannedFunctions =
          [ hlint.functions { functions = [ hlint.globalBan "fromJust" ] } ]

in  fixity.defFixities # bannedFunctions # recursion
```

Save this as `hlint.dhall`, run `cat hlint.dhall | dhall-to-yaml` and you should
get

```yaml
- fixity: infixr 3 ***
- fixity: infixr 3 &&&
- fixity: infixr 2 +++
- fixity: infixr 2 |||
- fixity: infixr 1 <=<
- fixity: infixl 4 <$
- fixity: infixl 4 $>
- fixity: infixl 1 <&>
- fixity: infixl 4 *>
- fixity: infixl 4 <*
- fixity: infixl 3 <|>
- fixity: infixl 4 <**>
- functions:
  - name: fromJust
    within: []
- error:
    lhs: hylo embed
    name: Use ananorphism
    rhs: ana
- error:
    lhs: hylo f project
    name: Use catamorphism
    rhs: cata f
- error:
    lhs: hyloM (pure . embed)
    name: Use monadic anamorphism
    rhs: anaM
- error:
    lhs: hyloM f (pure . project)
    name: Use monadic catamorphism
    rhs: cataM f
```

...containing prepackaged hints for working with recursion schemes as well as
fixity declarations for various operators in `base`.

## Contents

Lovingly provided by [polyglot](http://github.com/vmchale/polyglot):

```
-------------------------------------------------------------------------------
 Language             Files       Lines         Code     Comments       Blanks
-------------------------------------------------------------------------------
 Dhall                    5         139          117            0           22
 Markdown                 2          84           68            0           16
 YAML                     1          24           22            0            2
-------------------------------------------------------------------------------
 Total                    8         247          207            0           40
-------------------------------------------------------------------------------
```
