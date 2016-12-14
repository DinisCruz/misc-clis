# kubernetes-cli
Helper CLI to easily manage an Kubernetes docker cluster

### setup

from the command line run

```
. cli.sh
```

### available commands

type ```dk-``` followed by an tab to see the available commands:

```
dk-about                       dk-deployment-expose-local     dk-kubectl                     dk-pods-expand-name            dk-port                        dk-service-delete
dk-delete                      dk-deployments                 dk-logs                        dk-pods-find                   dk-port-forward                dk-services
dk-deployment-delete           dk-gogs                        dk-pod-port                    dk-pods-full-name              dk-ps                          dk-ssh
dk-deployment-expose-internet  dk-jenkins                     dk-pods                        dk-pods-names                  dk-run                         dk-ui
```

#### Why the dk prefix

* Because there wasn't any existing mappings on OSX for it (i.e. d+k+tab produces no results)
* the two letters are easy to type (d on the left and k on the right, followed by tab on the left)
* dk can represent docker-kubernetes
