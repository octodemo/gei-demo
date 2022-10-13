# GitHub Enterprise Importer Demo
This repo can be used to demo [GitHub Enterprise Importer (GEI)](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer)

## Prerequisites
[GitHub CLI](https://cli.github.com/)  
[GitHub Enterprise Importer CLI](https://github.com/github/gh-gei)  

## Demo
1. Copy `setenv.sh.orig` to `setenv.sh` and populate it with values for your migration.
1. Run `gh-migration-analyzer.sh` to demo the use of [gh-migration-analyzer](https://github.com/github/gh-migration-analyzer).
1. Run `gh-repo-stats.sh` to demo [gh-repo-stats](https://github.com/mona-actions/gh-repo-stats).
1. Run `migrate-repo.sh` to demo a repo migration.
1. (Optional) Run `gen-migration-script.sh` to demo generating a migration script.
1. Run `gen-mannequin-mapping.sh` to demo generating a mannequin mapping file after a migration.
1. Source repo locking/unlocking:  
    Demonstrate source repo locking by setting `LOCK_SOURCE_REPO` to `true` in `setenv.sh` and running `migrate-repo.sh`.  
    Unlock the source repo by running `source-lock-remove.sh`.


## Notes
[GEI limitations](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer/understanding-github-enterprise-importer/migration-support-for-github-enterprise-importer#support-limitations-for-github-enterprise-importer)  

## LFS
The process to migrate repos that contain files larger than 100mb is as follows:
1. Migrate the repo to LFS on the source system.
2. Migrate the repo using [GEI](https://github.com/github/gh-gei)
3. Migrate the LFS files [as described here](https://github.github.com/enterprise-migrations/#/./4.3.0-post-migration-global-caveats).

