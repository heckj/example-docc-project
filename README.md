# Example DocC Project

An example Swift package set up for hosting documentation.

The `Package.swift` exists to provide a target name and package structure around a DocC catalog that,
aside from Snippets, doesn't include any libraries, executables, or related API reference code.

You can edit and build the documentation content using Xcode, or from the command line.

## Building Documentation

To build and preview the documentation from the command line:

```bash
swift package --disable-sandbox preview-documentation
```

To build the documentation for distribution, use the `generate-documentation` command:

```bash
swift package generate-documentation
```

### Options

- Use `--hosting-base-path` to specify the base path where you host the content. 
  For example, using public github pages, the base path is typically the repository name.
  GitHub pages host at a virtual host based on the usename: `username.github.io`. 
  For this example, username: `heckj` and repository `example-docc-project`,
    the base path option would be `--hosting-base-path example-docc-project`.

- Use `--analyze --warnings-as-errors` to check on the status of the documentation content, which help identify broken links or missing content.

- Use `--checkout-path`, `--source-service`, and `--source-service-base-url` to specify the source code service and base URL for the documentation to provide a link in the documentation content to the repository. 
  For this example, the options would be `--source-service github --source-service-base-url heckj/example-docc-project

# --checkout-path /Users/heckj/src/example-docc-project \
# --source-service github --source-service-base-url heckj/example-docc-project \


## Publishing Documentation

Add your package to Swift Package Index to make it discoverable, and to host the documentation content.
You can also build the documentation and host it on GitHub Pages or any other static hosting service.
This example project is set up to host the documentation on GitHub Pages, using the following command:

```bash
swift package --disable-sandbox generate-documentation \
--hosting-base-path example-docc-project \
--analyze --warnings-as-errors \
--output-path docs
```

