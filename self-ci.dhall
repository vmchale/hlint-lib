let dhallCi =
      https://raw.githubusercontent.com/vmchale/github-actions-dhall/master/dhall-ci.dhall sha256:a3acdd525ca8a3f04971ffa461821d40179db267d898e4aed36f3cc2299e965c

in      dhallCi.dhallSteps
          [ dhallCi.dhallYamlInstall
          , dhallCi.checkDhallYaml [ "self-ci.dhall", "hlint.dhall" ]
          ]
      ⫽ { on = [ dhallCi.Event.push, dhallCi.Event.pull_request ] }
    : dhallCi.CI
