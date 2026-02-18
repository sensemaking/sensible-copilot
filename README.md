# Company Copilot CLI Plugin (scaffold)

Minimal scaffold for a Copilot CLI plugin to host company-wide agents, skills, MCPs, and custom instructions.

Installation
- Download plugin-<version>.zip from the GitHub release assets.
- Install via Copilot CLI, for example:
  copilot plugin install /path/to/plugin-<version>.zip

Development
- Update version in copilot-plugin.yml to release a new version.
- Build locally:
  - Linux/macOS: ./scripts/build.sh
  - Windows PowerShell: ./scripts/build.ps1
