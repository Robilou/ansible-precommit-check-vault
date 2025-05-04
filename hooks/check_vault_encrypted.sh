#!/bin/bash
set -e

ERROR=0

# Check all staged vault files (vault*.yml / *.yaml)
for file in $(git diff --cached --name-only | grep -E 'vault.*\.ya?ml$'); do
  if [ ! -f "$file" ]; then
    continue
  fi

  if ! head -n1 "$file" | grep -q "\$ANSIBLE_VAULT"; then
    echo "❌ ERROR: Vault file '$file' is not encrypted!"
    echo "➡️  Use: ansible-vault encrypt $file"
    ERROR=1
  fi
done

exit $ERROR
