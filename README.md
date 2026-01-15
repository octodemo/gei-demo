# GitHub Enterprise Importer Demo
This repo can be used to demo [GitHub Enterprise Importer (GEI)](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer)

## Prerequisites
[GitHub CLI](https://cli.github.com/)  
[GitHub Enterprise Importer CLI](https://github.com/github/gh-gei)  
[Powershell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)  
[gh-repo-stats](https://github.com/mona-actions/gh-repo-stats)  
[gh-repo-stats-plus](https://github.com/mona-actions/gh-repo-stats-plus)  
[gh-migration-audit](https://github.com/timrogers/gh-migration-audit)  
[gh-migration-validator](https://github.com/mona-actions/gh-migration-validator)  
[gh-unlock-source-repo](https://github.com/robandpdx/gh-unlock-source-repo)  
[Blob storage](https://docs.github.com/en/early-access/enterprise-importer/migrating-repositories-with-github-enterprise-importer/migrating-repositories-from-github-enterprise-server-to-github-enterprise-cloud#step-4-set-up-blob-storage) if migrating from GHES  

## Demo
1. Make sure [gh-gei](https://github.com/github/gh-gei) is up to date by running

```bash
gh extension upgrade github/gh-gei
```

2. Copy `setenv.sh.orig` to `setenv.sh` and populate it with values for your migration.
1. Run `gh-repo-stats.sh` to demo [gh-repo-stats](https://github.com/mona-actions/gh-repo-stats).
1. Run `gh-migration-audit.sh` to demo [gh-migration-audit](https://github.com/timrogers/gh-migration-audit).
1. Run `migrate-repo.sh` to demo a repo migration.
1. (Optional) Run `gen-migration-script.sh` to demo generating a migration script.
1. (Optional, only for GitHub.com to GHEC) Run `migrate-org.sh` to demo an org migration.
1. Run `gen-mannequin-mapping.sh` to demo generating a mannequin mapping file after a migration.
1. Fill out the third field of the `usermapping.csv` file, make sure the users are members of the org, then run `reclaim-mannequins.sh`.  
1. Source repository locking/unlocking:  
    Demonstrate source repository locking by setting `LOCK_SOURCE_REPO` to `true` in `setenv.sh` and running `migrate-repo.sh`.  
    Unlock the source repository by running `source-lock-remove.sh`.


## Notes
[GEI limitations](https://docs.github.com/en/early-access/github/migrating-with-github-enterprise-importer/understanding-github-enterprise-importer/migration-support-for-github-enterprise-importer#support-limitations-for-github-enterprise-importer)  

## LFS
The process to migrate repos that contain files larger than 100mb is as follows:
1. Migrate the repo to LFS on the source system.
2. Migrate the repo using [GEI](https://github.com/github/gh-gei)
3. Migrate the LFS files [as described here](https://github.github.com/enterprise-migrations/#/./4.3.0-post-migration-global-caveats).

> **Note:** Due to [an issue with LFS](https://github.com/git-lfs/git-lfs/issues/4899), it's better to run the following, rather than `git lfs push github --all`
>
>```
>for object_id in $(git lfs ls-files --long | awk '{print $1}'); do
>    git lfs push --object-id github "$object_id"
>done
>```