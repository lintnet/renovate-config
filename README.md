# renovate-config

Renovate Config Preset to update lintnet Modules

e.g. [lintnet/examples#131](https://github.com/lintnet/examples/pull/131)

## Presets

- [default.json](default.json)
- [file.json](file.json)

## Usage

```json
{
  "extends": [
    "github>lintnet/renovate-config#0.1.0"
  ]
}
```

If you want to change fileMatch, the preset `file` is useful.

```json
{
  "extends": [
    "github>lintnet/renovate-config:file#0.1.1(README\\.md)"
  ]
}
```

## LICENSE

[MIT](LICENSE)
