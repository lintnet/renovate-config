{
  customManagers: [
    {
      customType: 'regex',
      datasourceTemplate: 'github-releases',
      fileMatch: [
        '\\.?lintnet\\.ya?ml$',
      ],
      matchStrings: [
        // - github.com/suzuki-shunsuke/tfcmt/examples/lint/csv.jsonnet@ebd3c7221bf26d51d3cdd0838844dcf14d28ba80 # v4.7.0
        "(?<depName>github\\.com/(?<packageName>[^'\" .@/\\n]+/[^'\" @/\\n]+)(/[^'\" /@\\n]+)+)@(?<currentValue>[^'\" @/\\n]+)",
      ],
    },
    {
      customType: 'regex',
      datasourceTemplate: 'github-releases',
      fileMatch: [
        '\\.jsonnet$',
        '\\.libsonnet$',
      ],
      matchStrings: [
        // local hello = import 'github.com/suzuki-shunsuke/tfcmt/examples/lint/csv.jsonnet@v4.7.0';
        "^ *local .*= *import '(?<depName>github\\.com/(?<packageName>[^'\" .@/\\n]+/[^'\" @/\\n]+)(/[^'\" /@\\n]+)*)@(?<currentValue>[^'\" @/\\n]+)'",
        "^ *local .*= *import \"(?<depName>github\\.com/(?<packageName>[^'\" .@/\\n]+/[^'\" @/\\n]+)(/[^'\" /@\\n]+)*)@(?<currentValue>[^'\" @/\\n]+)\"",
      ],
    },
    {
      fileMatch: [
        '^renovate\\.json5?$',
        '^\\.github/renovate\\.json5?$',
        '^\\.gitlab/renovate\\.json5?$',
        '^\\.renovaterc\\.json$',
        '^\\.renovaterc$',
      ],
      matchStrings: [
        '"github>lintnet/renovate-config#(?<currentValue>[^" \\n\\(]+)',
        '"github>lintnet/renovate-config:.*#(?<currentValue>[^" \\n\\(]+)',
        '"github>lintnet/renovate-config/.*#(?<currentValue>[^" \\n\\(]+)',
      ],
      datasourceTemplate: 'github-releases',
      depNameTemplate: 'lintnet/renovate-config',
    },
  ],
}
