module.exports = {
  hooks: {
    'commit-msg': 'commitlint -E HUSKY_GIT_PARAMS',
    'pre-commit': 'ls-lint && terraform validate && terraform fmt && git update-index --again && terraform-docs markdown ./ > README.md && git add README.md'
  }
}
