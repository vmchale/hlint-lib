let dhallCi =
      https://raw.githubusercontent.com/vmchale/github-actions-dhall/master/dhall-ci.dhall sha256:af279cc8b83d041c03553a62a06ce0e4f64a0d08bd1ed1e0f4f93735fe728f7e

in      dhallCi.dhallSteps
          [ dhallCi.dhallYamlInstall
          , dhallCi.checkDhallYaml [ "self-ci.dhall", "hlint.dhall" ]
          ]
      ⫽ { on =
            [ dhallCi.printEvent dhallCi.Event.Push
            , dhallCi.printEvent dhallCi.Event.PullRequest
            ]
        }
    : dhallCi.CI
