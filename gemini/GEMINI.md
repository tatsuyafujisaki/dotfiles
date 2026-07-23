- Follow the [Google Developer Documentation Style Guide](https://developers.google.com/style).
- For TypeScript repositories:
  - Avoid defining a `"scripts"` section in `package.json`.
  - Use `"latest"` for all package versions in `package.json`.
  - Set `"private": true` in `package.json`.
  - Use [gts](https://www.npmjs.com/package/gts).
    - If `README.md` is missing, create it and add the following badge at the top:
      ```markdown
      [![Code Style: Google](https://img.shields.io/badge/code%20style-google-blueviolet.svg)](https://github.com/google/gts)
      ```
  - Do not use [tsx](https://www.npmjs.com/package/tsx).
  - Require Node.js v23.6+ and execute TypeScript files natively (e.g., `node foo.ts`).
- For Python repositories:
  - Use [Ruff](https://pypi.org/project/ruff/).
  - Avoid pinning dependency versions so the latest versions are always used.
  - If `README.md` is missing, create it and add the following badge at the top:
    ```markdown
    [![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
    ```
