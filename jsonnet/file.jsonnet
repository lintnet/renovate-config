local util = import 'util.libsonnet';

{
  customManagers: [
    util.config(['{{arg0}}']),
    util.lint(['{{arg0}}']),
    util.renovate(['{{arg0}}']),
  ],
}
