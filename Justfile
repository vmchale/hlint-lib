build:
    @cat hlint.dhall | dhall-to-yaml

poly:
    @poly -e Justfile
