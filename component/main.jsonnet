// main template for gitlab-runner
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local prometheus = import 'lib/prometheus.libsonnet';
local inv = kap.inventory();


// The hiera parameters for the component
local params = inv.parameters.gitlab_runner;

local namespace =
  if params.monitoring_enabled then
    prometheus.RegisterNamespace(kube.Namespace(params.namespace))
  else
    kube.Namespace(params.namespace)
;

// Define outputs below
{
  '00_namespace': namespace
}


