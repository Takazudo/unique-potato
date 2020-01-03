#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e0f64ee8f48840019546d68/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e0f64ee8f48840019546d68
curl -s -X POST https://api.stackbit.com/project/5e0f64ee8f48840019546d68/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e0f64ee8f48840019546d68/webhook/build/publish > /dev/null
