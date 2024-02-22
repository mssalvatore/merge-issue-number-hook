# Merge Issue Number Hook

## Description
This is a pre-commit hook that automatically formats merge commit messages when
merging branches whose names conform to a specific pattern.

Example:
```sh
$ git merge 123-branch-name
```

The above command results in a merge commit message that looks like

```
Merge branch '123-branch-name' into main

Issue #123
```


## Installation

Add the following to your `.pre-commit.yaml`:
```yaml
  - repo: https://github.com/mssalvatore/merge-issue-number-hook
    rev: v1.0.0
    hooks:
      - id: merge-issue-number
```

Then run `pre-commit install -t prepare-commit-msg`.
