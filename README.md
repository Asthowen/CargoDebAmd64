<!--suppress HtmlDeprecatedAttribute -->
<h1 align="center">
  CargoDebAmd64
</h1>
<h3 align="center">
    <strong>Action for creating .deb package for Rust projects using cargo-deb for AMD64.</strong>
</h3>

> This repository is a simple fork of [cargo-deb-amd64-ubuntu](https://github.com/ebbflow-io/cargo-deb-amd64-ubuntu/).

Provides a build environment for executing `cargo-deb` and producing statically linked binaries for the built Debian (`.deb`) package.

**NOTE**: This package may fail to build your project if your build links against other OS-provided libraries. The underlying OS image is provided by [muslrust](https://github.com/clux/muslrust) and if additional packages are needed, please follow up with that project.

## Inputs
`cmd` - The command to be executed inside the container. Defaults to `cargo deb --target=x86_64-unknown-linux-musl`

## Outputs
None, besides the `deb` package that is built. The built `.deb` will be located in `target/x86_64-unknown-linux-musl/debian/<DEB>`.

## Example Usage
```yaml
name: Build deb package

on:
  push:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    - name: Build .deb
      uses: asthowen/CargoDebAmd64@main
```