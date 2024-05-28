local util = import 'util.libsonnet';

{
  customManagers: [
    util.config(),
    util.lint(),
    util.renovate(),
  ],
}
