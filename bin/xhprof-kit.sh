# Creates a baseline from your 8.x branch.
alias bbranch='./xhprof-kit/benchmark-branch.sh `git rev-parse --abbrev-ref HEAD`'

# Using the baseline xhprof identifier from the bbranch command above will benchmark 8.x against the baseline and your patched branch.
# e.g.
#   bbranches [XHPROF-IDENTIFIED] [twig-branch-name-here-1234456]
function bbranches() {
  originalbranch="$(git rev-parse --abbrev-ref HEAD)"
  base=$1
  shift
  ./xhprof-kit/benchmark-branches.sh $base "$originalbranch" "$originalbranch" "$@"
  git checkout -q "$originalbranch" --
  drush cr
}

# Use ubench to upload your benchmarks.
# Change the APIKEY to your Key and the API-Identifier to your identifier below.
function ubench() {
  ./xhprof-kit/upload-bench.sh "43d3a41efee3f101de21bc9fb2c0e6f2" drupal-perf-joelpittet $1 `git rev-parse --abbrev-ref HEAD`
}

# git completion, comment out for branch completion for bbranch and bbranches commands
# I am using homebrew git and homebrew bash completion, `brew install bash-completion`.
#__git_complete bbranch _git_checkout
#__git_complete bbranches _git_checkout
