# cli-tools

Some command-line tools to help my workflow

# Installation

```sh
./install.sh
```
Then add `bin` folder to your `PATH`. 

# Overwiew
To see extended help, try adding `-h` as an argument.

## `google` (`g`)
Tool to open google query from command line

### Usage: 
```sh
g <request>
```
Opens browser with your request

## `browser `(`b`)
Tool to open link without entering prefix (i.e. `http://` or `https://`). By default adds `https://` prefix.

### Usage: 
```sh
b <url without prefix>
```

## `svace-issue` (`svi`)
Internal tool for svace developers only.

### Usage:
To open issue with <issue_id>:
```sh
svi <issue_id>
```

To open issue comment with <commend_id>
```sh
svi <issue_id> -c|--comment <comment_id>
```

To open all issues
```sh
svi
```

To open task table (aka tablichka)
```sh
svi -t|--task
```
