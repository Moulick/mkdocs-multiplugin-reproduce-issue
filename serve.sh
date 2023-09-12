#!/bin/bash

set -e

basedir=$(readlink -f "$(dirname "$0")")
readonly basedir

venvdir="${basedir}/venv"
readonly venvdir

python3 -m venv "${venvdir}" --upgrade-deps

# shellcheck disable=SC1091
source "${venvdir}/bin/activate"

pip3 install -r "${basedir}/requirements.txt"
mkdocs serve -f "${basedir}/mkdocs.yml"
