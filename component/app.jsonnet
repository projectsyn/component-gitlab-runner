local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.gitlab_runner;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('gitlab-runner', params.namespace);

{
  'gitlab-runner': app,
}
