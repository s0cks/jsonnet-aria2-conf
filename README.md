# aria2.conf

> This repository contains Jsonnet for generating an aria2.conf file. See below for usage instructions

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Generating a configuration](#generating-a-configuration)
- [LICENSE](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Usage

### Prerequisites

In order to generate an `aria2.conf` you will need the following:

- [jsonnet](https://github.com/google/go-jsonnet)
- [task](https://taskfile.dev/)

### Generating a configuration

To generate an `aria2.conf` you can do the following:

```sh
# using Taskfile:
task    # defaults to: task generate

# manually using Jsonnet:
jsonnet -J . -S -m . aria2.jsonnet \
    --ext-str ARIA2_SECRET="$(./bin/generate-rpc-secret)" \
    --ext-str ARIA2_USER_AGENT="$USER_AGENT" \
    --ext-str ARIA2_HOME="/usr/local/share/aria2"
```

## LICENSE

See [LICENSE](/LICENSE)
