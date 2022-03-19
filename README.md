# H & M Recommender Kaggle

# Development

## Getting Started

Use the provided script:

```bash
./script/local-setup.sh
```

If you ever get your environment messed up you can re-run the script to try fix.

You can also `rm -rf venv` to delete the venv and re-run the script, it will setup venv again for you.

## How to add a new dependency (normal)

- Add the package name to `requirements.in`.
- Run `pip-compile requirements.in`.
- Run `pip-sync requirements.in requirement-dev.in`.
- Add `requirements*` to your next commit.

## How to add a new dependency (for development only)

- Add the package name to `requirements-dev.in`.
- Run `pip-compile requirements-dev.in`.
- Run `pip-sync requirements.in requirement-dev.in`.
- Add `requirements*` to your next commit.
