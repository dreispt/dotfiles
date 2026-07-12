#!/usr/bin/env bash
set -e

pip3 install flake8 pylint pylint-odoo pre-commit click-odoo-contrib
pip3 install neovim pynvim jedi autopep8
pip3 install --upgrade msgpack  # deodeplete
