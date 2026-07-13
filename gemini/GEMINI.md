- Follow https://developers.google.com/style
- In a repository that uses TypeScript ...
  - avoid defining the "scripts" section.
  - use "latest" for the version of each package in the "package.json" file.
  - use https://www.npmjs.com/package/gts
    - create the "README.md" file if it is missing. Subsequently, add the following line at the top of the file:
    ```markdown
    [![Code Style: Google](https://img.shields.io/badge/code%20style-google-blueviolet.svg)](https://github.com/google/gts)
    ```
  - don't use https://www.npmjs.com/package/tsx
  - ensure that Node.js is installed and versioned at 23.6 or higher. Then, execute the command "node foo.ts" to compile the TypeScript file.
- In a repository that uses Python ...
  - use https://pypi.org/project/ruff/
  - avoid specifying the version of each dependency package to ensure that the latest version is always used.
  - create the "README.md" file if it is missing. Subsequently, add the following line at the top of the file:
    ```markdown
    [![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
    ```
