# GitHub Enterprise Importer Demo
This repo can be used to demo [GitHub Enterprise Importer (GEI)](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer)

## Prerequisites
[GitHub CLI](https://cli.github.com/)  
[GitHub Enterprise Importer CLI](https://github.com/github/gh-gei)  

## Demo
1. Copy `setenv.sh.orig` to `setenv.sh` and populate it with values for your migration.
1. Run `migrate-repo.sh` to demo a repo migration.
1. (Optional) Run `gen-migration-script.sh` to demo generating a migration script.
1. Run `gen-mannequin-mapping.sh` to demo generating a mannequin mapping file after a migration.

## Notes
[GEI limitations](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer/understanding-github-enterprise-importer/migration-support-for-github-enterprise-importer#support-limitations-for-github-enterprise-importer)  
[Migration-friction #536 - GHES->GHEC Issues and PRs not migrated](https://github.com/github/migration-friction/issues/536)  
[GEI #385 - lock repos](https://github.com/github/gh-gei/issues/385)  
[Octoshift #5096 - GHEC EMU->GHEC EMU](https://github.com/github/octoshift/issues/5096)