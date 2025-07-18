# Example DocC Project

An example Swift package set up for hosting documentation.

The `Package.swift` exists to provide a target name and package structure around a DocC catalog that,
aside from Snippets, doesn't include any libraries, executables, or related API reference code.

You can edit and build the documentation content using Xcode, or from the command line.

## Package Structure

This repository is structured to put the Documentation catalog at the root of the repository, which comes with some tradeoffs.
The `Package.swift` file is set up with a target that looks for sources in this directory, which means
that the swift compiler warns about files it doesn't know about.
A couple of files (`LICENSE` and `README.md`) are explicitly excluded in the [package manifest](./Package.swift), but the `/docs` directory and its files - aren't included in that set.
The side effect of this is that everything builds normally, but you'll see warnings from the Swift compiler when invoking the documentation preview or builds.

The default structure for a Swift package would place the documentation catalog (the directory `Documentation.docc`) in the sources location based on the target.
In this example, that target is named `ExampleDocs` - so the default location is `Sources/ExampleDocs`.
The default structure is better for general usage - for example when you're provided API reference for a library or executable, or want to provide more than one catalog within the same repository.

## Building Documentation

To build and preview the documentation from the command line:

```bash
swift package --disable-sandbox preview-documentation --target ExampleDocs
```

To build the documentation for distribution, use the `generate-documentation` command:

```bash
swift package generate-documentation --target ExampleDocs
```

### Options

- Use `--hosting-base-path` to specify the base path where you host the content. 
  For example, using public github pages, the base path is typically the repository name.
  GitHub pages host at a virtual host based on the usename: `username.github.io`. 
  For this example, username: `heckj` and repository `example-docc-project`,
    the base path option would be `--hosting-base-path example-docc-project`.

- Use `--analyze --warnings-as-errors` to check on the status of the documentation content, which help identify broken links or missing content.

- Use `--checkout-path`, `--source-service`, and `--source-service-base-url` to specify the source code service and base URL for the documentation to provide a link in the documentation content to the repository. 
  For this example, the options would be `--source-service github --source-service-base-url heckj/example-docc-project`
  There may be an issue with using `--checkout-path` and related options with Swift 6.2 - [still debugging that](https://github.com/swiftlang/swift-docc/issues/1248).

## Publishing Documentation

Add your package to [Swift Package Index](https://swiftpackageindex.com) to host the documentation and make it discoverable.
You can also build the documentation and host it on GitHub Pages or any other static hosting service.
This example project is set up to host the documentation on GitHub Pages, using the following command:

```bash
export DOCC_JSON_PRETTYPRINT=YES # makes the output JSON easier to read, and diff
swift package --disable-sandbox generate-documentation \
--target ExampleDocs \
--hosting-base-path example-docc-project \
--analyze --warnings-as-errors \
--output-path docs
```

The GitHub pages configuration:

![A screenshot of the GitHub pages configuration. Deploy from source, branch `main`, deploying from the directory `docs`.](img/github-pages-config.png)

The resulting pages are hosted at [heckj.github.io/example-docc-project](https://heckj.github.io/example-docc-project).

> ⚠️ Warning: DocC doesn't currently generate a link from the base directory to its content, so accessing the above URL 
> results in "Page not found", even though the content IS hosted. Link to the content directly, in this case: [https://heckj.github.io/example-docc-project/documentation/exampledocs/](https://heckj.github.io/example-docc-project/documentation/exampledocs/).
