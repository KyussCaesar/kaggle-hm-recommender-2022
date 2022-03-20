# H & M Recommender Kaggle

# Development

Use the provided script to ensure your environment is set up correctly.

```bash
./script/local-setup.sh
```

If you ever get your environment messed up you can re-run the script to try fix.

You can also `rm -rf venv` to delete the venv and re-run the script, it will setup venv again for you.

Also you should make sure notebook file root is `${workspaceFolder}` in VS Code config.

## How to add a new dependency (normal)

- Add the package name to `requirements.in`.
- Run `./script/local-setup.sh`.
- Add `requirements*` to your next commit.

## How to add a new dependency (for development only)

- Add the package name to `requirements-dev.in`.
- Run `./script/local-setup.sh`.
- Add `requirements*` to your next commit.

## Import stuff from other notebooks

```python
import notebooks
from notebooks import data_storage # will import data_storage.ipynb as a module

articles = data_storage.load_dataset('articles')
```
