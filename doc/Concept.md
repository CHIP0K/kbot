# Comparison for  minikube, kind and k3d

## Spekifications

| | **Supported OS** | **Architecture** | **Capability of automation** | **Monitoring** | **Control** | Project link |
|-|-|-|-|-|-|-|
| **minikube** | Linux, Windows, macOS | amd64 (win, mac), arm64 (mac, linux), arm (linux), ppc64le (linux), s390x (linux) | yes | yes | yes | [kubernetes/minikube](https://github.com/kubernetes/minikube) |
| **kind** | Linux, Windows, macOS | amd64, arm64 | yes | yes | yes | [kubernetes-sigs/kind]([Concept.md](https://github.com/kubernetes-sigs/kind)) |
| **k3d** | Linux, Windows, macOS | amd64, arm64 (mac, linux), 386 (linux), arm (linux) | yes | yes | yes | [k3d-io/k3d](https://github.com/k3d-io/k3d) |

## Minikube

### Advantages (minikube)

* Easy installation and usage on the local machine
* Quickly start-up POC
* Popularity and community (26k Stars and 816 contributors on github)

### Disadvantages (minikube)

* Run only on a single machine

#### Demo (minikube)

[![asciicast](https://asciinema.org/a/586339.svg)](https://asciinema.org/a/586339)

## Kind

### Advantages (kind)

* Easy installation and usage on the local machine
* Available multi node run the cluster
* More elastic for development and test.
* More popular than k3d

### Disadvantages (kind)

* Dependence from Docker.
* Over head usage machine resource

#### Demo (kind)

[![asciicast](https://asciinema.org/a/fmZHwX42mCjyUXm4lVgOLxOH3.svg)](https://asciinema.org/a/fmZHwX42mCjyUXm4lVgOLxOH3)

## k3d

### Advantages (k3d)

* Easy installation and usage on the local machine
* Available multi node run the cluster
* More elastic for development and test.

### Disadvantages (k3d)

* Dependence from Docker.
* Over head usage machine resource
* the least popular of all

#### Demo (k3d)

[![asciicast](https://asciinema.org/a/586350.svg)](https://asciinema.org/a/586350)

## Conclusion

I recommend minikube for local development and tests because it is straightforward and popular and it has a low threshold entry. If you have multi-node use, I recommend k3d.
