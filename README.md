# ansible-precommit-check-vault

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://pre-commit.com/)

A simple [pre-commit](https://pre-commit.com) hook that ensures your **Ansible Vault files are encrypted** before they are committed.

This helps prevent accidental commits of sensitive secrets (like passwords, tokens, or private keys) in plaintext YAML files such as `vault.yml`.

---

## ✅ What it does

The hook scans staged files matching this pattern:

```
vault*.yml, vault*.yaml
```

It then checks that the first line of each file begins with the standard Ansible Vault header:

```
$ANSIBLE_VAULT;
```

If not, the commit is blocked and a helpful message is shown.

---

## 🛠 Installation

Make sure you have [`pre-commit`](https://pre-commit.com/#install) installed:

```bash
brew install pre-commit  # on macOS
# or
pip install pre-commit
```

Then add this hook to your project's `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/robilou/ansible-precommit-check-vault
    rev: v0.1.0
    hooks:
      - id: check-vault-encrypted
```

> 💡 Use the latest version tag from [Releases](https://github.com/robilou/ansible-precommit-check-vault/releases).

Run this once in your project:

```bash
pre-commit install
```

And test it manually:

```bash
pre-commit run --all-files
```

---

## 🔒 Example output

If you try to commit a non-encrypted vault file, you'll see:

```
❌ ERROR: Vault file 'group_vars/all/vault.yml' is not encrypted!
➡️  Use: ansible-vault encrypt group_vars/all/vault.yml
```

---

## 📦 Developing locally

You can run the hook manually from the root of your project:

```bash
hooks/check_vault_encrypted.sh
```

Or integrate it into your `Makefile`:

```makefile
check-vault:
 bash hooks/check_vault_encrypted.sh
```

---

## 🧾 License

MIT License — see [`LICENSE`](LICENSE) for details.
