export default {
  '*.json': ['prettier --write'],
  '*.md': ['prettier --write'],
  '*.{yml,yaml}': ['prettier --write'],
  '*.{tf,tfvars}': () => {
    return ['pnpm run lint', 'pnpm run docs']
  }
}

