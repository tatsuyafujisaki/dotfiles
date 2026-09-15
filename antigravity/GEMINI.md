- Follow the [Google Developer Documentation Style Guide](https://developers.google.com/style).
- Unless explicitly requested, do not run any tests.
- For Flutter repositories:
  - After making any changes, run `dart fix --apply && dart format . && flutter analyze` and fix all analysis issues.
  - Use `fvm flutter` and `fvm dart` instead of the bare `flutter` and `dart` commands.
  - Unless a device is specified, take screenshots using the first available device in the following order:
    - Physical iPhone
    - iOS Simulator
    - Physical Android device
    - Android Emulator
- For Python repositories hosted at https://github.com/tatsuyafujisaki:
  - Use [Ruff](https://pypi.org/project/ruff/).
  - Do not pin dependency versions so the latest versions are always used.
  - If `README.md` is missing, create it and add the following badge at the top:
    ```markdown
    [![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
    ```
- For TypeScript repositories hosted at https://github.com/tatsuyafujisaki:
  - In `package.json`:
    - Do not define the following fields:
      - author
      - license
      - name
      - repository
      - scripts
      - type
      - version
    - Use `"latest"` for all package versions.
    - Set `"private": true`.
    - Sort all keys in alphabetical order.
  - Use [gts](https://www.npmjs.com/package/gts).
    - If `README.md` is missing, create it and add the following badge at the top:
      ```markdown
      [![Code Style: Google](https://img.shields.io/badge/code%20style-google-blueviolet.svg)](https://github.com/google/gts)
      ```
  - Do not use [tsx](https://www.npmjs.com/package/tsx).
  - Require Node.js 23.6 or later, and execute TypeScript files natively (e.g., `node foo.ts`).
