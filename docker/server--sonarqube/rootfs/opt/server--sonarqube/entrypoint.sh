#!/bin/bash

set -euo pipefail

sudo chown -R sonarqube:sonarqube ./

./bin/run.sh ${@}
