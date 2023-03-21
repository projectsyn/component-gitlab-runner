// main template for gitlab-runner
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();

// The hiera parameters for the component
local params = inv.parameters.gitlab_runner;

local namespace = kube.Namespace(params.namespace) {
  metadata+: {
    labels+: params.namespaceLabels,
  },
};

// Define outputs below
{
  '00_namespace': namespace,
}
