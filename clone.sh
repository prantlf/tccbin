#!/usr/bin/env bash

set -euo pipefail

git clone --depth 1 git://repo.or.cz/tinycc.git .
git rev-parse --short HEAD
