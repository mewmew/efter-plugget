# Uni lab report, essay and assignment template for Typst

## Example document

```bash
# Init new report based on template.
typst init @local/uni-report
```

# Local development

Run the following commands to make the package available for local development to Typst under the import path `@local/uni-report:0.1.0`.
```bash
mkdir -p ~/.local/share/typst/packages/local/uni-report
ln -s "$(realpath uni-report)"  ~/.local/share/typst/packages/local/uni-report/0.1.0
```
