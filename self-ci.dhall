let dhallCi =
      ./dhall-ci.dhall sha256:6468d335d3d9ae593ca92c3cf08ecbf07571e662272608c3e98ea19ae7c8dd58

in    dhallCi.dhallSteps
        [ dhallCi.dhallYamlInstall
        , dhallCi.checkDhallYaml [ "self-ci.dhall", "hlint.dhall" ]
        ]
    : dhallCi.CI
