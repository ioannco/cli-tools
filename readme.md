## Command-Line Tools to Enhance Workflow

### Installation

```sh
./install.sh
```

After installation, add the `bin` folder to your `PATH` environment variable.

### Overview

To access comprehensive help, utilize the `-h` argument.

### `google` (`g`)

This tool facilitates the opening of a Google search query from the command line.

#### Usage:
```sh
g <request>
```

The tool launches a browser with the specified search query.

### `browser` (`b`)

The `browser` tool simplifies the process of opening a URL without the need to explicitly enter the prefix (e.g., `http://` or `https://`). By default, the tool appends the `https://` prefix.

#### Usage:
```sh
b <url without prefix>
```
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
svi -t|--table
```
