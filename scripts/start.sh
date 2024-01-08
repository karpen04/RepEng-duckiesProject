#!/bin/bash

# Script Name: start.sh
# Description: This script executes all scripts in order.
# Author: Oleksandr Karpenko, karpen04@ads.uni-passau.de
# Version: 1.0
# SPDX-License-Identifier: MIT
#
# Usage: ./start.sh

echo "Running smoke.sh"
bash ./smoke.sh

echo "Running solver_optimization.py (should raise an exception for now)"
python3 solver_optimization.py

echo "Building a report and cleaning up cahce files..."
cd ~/report
make report
make clean

echo "Report .pdf should be in the report folder"
cd ~/scripts

