local modulePattern = "github_archive/(?<depName>github\\.com/(?<packageName>[^'\" .@/\\n]+/[^'\" @/\\n]+)(/[^'\" /@\\n]+)+)@(?<currentDigest>[0-9a-fA-F]{40}):(?<currentValue>[^'\" @/\\n]+)";

{
  customManagers: [
    {
      customType: 'regex',
      datasourceTemplate: 'github-releases',
      fileMatch: [
        '\\.?lintnet\\.jsonnet$',
      ],
      matchStrings: [
        // github_archive/github.com/suzuki-shunsuke/tfcmt/examples/lint/csv.jsonnet@ebd3c7221bf26d51d3cdd0838844dcf14d28ba80:v4.7.0
        modulePattern,
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
        // local hello = import 'github_archive/github.com/suzuki-shunsuke/tfcmt/examples/lint/csv.jsonnet@ebd3c7221bf26d51d3cdd0838844dcf14d28ba80:v4.7.0';
        "^ *local .*= *import '%s'" % [modulePattern],
        '^ *local .*= *import "%s"' % [modulePattern],
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
