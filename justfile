alias r := rubocop
alias t := spec

# run rubocop
rubocop *ARGS:
    bundle exec rubocop {{ARGS}}

# run specs
spec *ARGS:
    ./bin/rspec {{ARGS}}

# run docs for solargraph lsp to pickup new gems
docs:
    bundle exec yard gems

# runs linter and spec checks
check: rubocop spec
