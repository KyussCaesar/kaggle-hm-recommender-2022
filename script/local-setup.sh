#!/bin/bash
set -euo pipefail
set -x

msg () {
  echo "$*" >&2
}

if ! command -v asdf
then
  msg 'You should install asdf-vm, refer to instructions on their website: http://asdf-vm.com/guide/getting-started.html'
  exit 1
fi

export ASDF_PYTHON_VERSION=3.10.3

asdf install python "$ASDF_PYTHON_VERSION"

if ! [ -d venv ]
then
  msg 'Creating a new venv because the venv directory was not found.'
  python -m venv venv
fi

if [ -z "${VIRTUAL_ENV:-}" ]
then
  . venv/bin/activate
fi

pip install --upgrade pip pip-tools

# https://github.com/jazzband/pip-tools#workflow-for-layered-requirements
pip-compile
pip-compile requirements-dev.in
pip-sync requirements.txt requirements-dev.txt

# https://srinivas1996kumar.medium.com/adding-custom-kernels-to-a-jupyter-notebook-in-visual-studio-53e4d595208c
python -m ipykernel install --user --name $(basename $(pwd)) --display-name $(basename $(pwd))
