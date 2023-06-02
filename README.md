# kbot

DevOps kube bot

## Setup bot

```bash
go get # Download modules
go build -ldflags="-X="github.com/CHIP0K/kbot/cmd.appVersion=v1.0.1 # build app
```

## Usage

[Open bot](https://t.me/ChipK_bot)

### Supported commands

```text
/start test # test message
/start hello # Hello response message with info app version.
```

## Prompt examples

| Name | Prompt | Description | Example |
|-|-|-|-|
| app | app.yaml | Application configuration file, pod deployment | [app.yaml](yaml/app.yaml) |
| app-livenessProbe | app-livenessProbe.yaml | Liveness probe configuration for the application | [app-livenessProbe.yaml](yaml/app-livenessProbe.yaml)|
| app-readinessProbe | app-readinessProbe.yaml | Readiness probe configuration for the application | [app-readinessProbe.yaml](yaml/app-readinessProbe.yaml) |
| app-volumeMounts | app-volumeMounts.yaml | Volume mounts configuration for the application | [app-volumeMounts.yaml](yaml/app-volumeMounts.yaml) |
| app-cronjob | app-cronjob.yaml | Cron job configuration for the application | [app-cronjob.yaml](yaml/app-cronjob.yaml) |
| app-job | app-job.yaml | Job configuration for the application | [app-job.yaml](yaml/app-job.yaml) |
| app-multicontainer | app-multicontainer.yaml | Multi-container configuration for the application | [app-multicontainer.yaml](yaml/app-multicontainer.yaml) |
| app-resources | app-resources.yaml | Resource limits and requests configuration for the application | [app-resources.yaml](yaml/app-resources.yaml) |
| app-secret-env | app-secret-env.yaml | Secret environment variables configuration for the application | [app-secret-env.yaml](yaml/app-secret-env.yaml) |

## Helm

### Install application

```bash
helm install kbot https://github.com/CHIP0K/kbot/releases/download/v1.0.0/helm-1.0.0.tgz \
 --set kbot_env.token="6111111114:AAH1AAAAAAAAAAAAAAAAAAAAA_noE"
```

6111111114:AAH1AAAAAAAAAAAAAAAAAAAAA_noE - your telegram token
