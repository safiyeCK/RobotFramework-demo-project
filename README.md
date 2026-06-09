# Robot Framework Demo Project

This repository is a small Robot Framework UI automation demo based on the Cypress project structure.

## What is included

- Login flow
- Registration flow
- Shared page resources
- Environment-based variable loading

## Tech stack

- Robot Framework
- SeleniumLibrary
- Python

## Project structure

```text
resources/
  common/
    browser.robot
  pages/
    dashboard_page.robot
    login_page.robot
    register_page.robot
  variables/
    environment.py
tests/
  login_tests.robot
  register_tests.robot
results/
```

## Setup

1. Create and activate a virtual environment.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

## Run tests

Run all tests:

```bash
robot --variablefile resources/variables/environment.py --outputdir results tests
```

Run smoke tests:

```bash
robot --variablefile resources/variables/environment.py --outputdir results --include smoke tests
```

Run regression tests:

```bash
robot --variablefile resources/variables/environment.py --outputdir results --include regression tests
```

Run only login tests:

```bash
robot --variablefile resources/variables/environment.py --outputdir results tests/login_tests.robot
```

Run only register tests:

```bash
robot --variablefile resources/variables/environment.py --outputdir results tests/register_tests.robot
```

## Environment selection

The demo reads the `TARGET_ENV` environment variable.

Supported values:

- `dev`
- `qa`
- `staging`

Example for PowerShell:

```powershell
$env:TARGET_ENV = "qa"
robot --variablefile resources/variables/environment.py --outputdir results tests
```

## Notes

The test data was translated from the Cypress fixtures and page objects in the original project.

## CI

GitHub Actions workflow is available at:

- .github/workflows/robot-ci.yml

The workflow:

- Runs on push and pull request
- Supports manual run with target environment selection
- Uploads Robot Framework report artifacts from the results folder
