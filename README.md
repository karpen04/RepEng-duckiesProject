# Replication Package for "Duckies" Project
This repository contains replication package for "Duckies" Project. "Duckies" problem was presented in chapter 3 of "Head First Data Analysis" book, by Michael Milton, O`Reilly, 9780596153939, https://www.oreilly.com/library/view/head-first-data/9780596806224/.

## Replication package usage
### Installation
1. After cloning the repository
    > git clone https://github.com/karpen04/RepEng-duckiesProject.git
- build a docker image with
    > docker build -t <image_name> .
2. When, run a docker container
    > docker run -it <image_name>

### Docker container layout
The docker container layout looks as: 
```.
|-- data
|   `-- 'data .xls files'
|-- report
|   |-- Makefile
|   `-- 'report source files'
|-- results
    `-- 'result files'
`-- scripts
    |-- smoke.sh
    |-- start.sh
    `-- solver_optimization.py
```
- To invoke installed software, necessary for project, use:
    > scripts/smoke.sh

- To run experiment, use (for now throws NotImplementedExcaeption):
    > python3 scripts/solver_optimization.py

- To run every script in order (check software, run experiment and build a report), use:
    > scripts/start.sh

- If you want to build a report separately, move to the ```report``` folder and use:
    > make report

- To clean cache files after building use:
    > make clean

## Changes to the original repository
For now none of these are made.
