#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SECRET_NAMESPACE=${SECRET_NAMESPACE:-ingress-nginx}
SECRET_NAME=${SECRET_NAME:-ingress-nginx-admission}
PEM_FOLDER=${PEM_FOLDER:-/tmp/certs}

mkdir -p ${PEM_FOLDER}

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=ingress-nginx/CN=admission' -keyout ${PEM_FOLDER}/key.pem -out ${PEM_FOLDER}/cert.pem

kubectl create secret tls ${SECRET_NAME} --key ${PEM_FOLDER}/key.pem --cert ${PEM_FOLDER}/cert.pem --namespace ${SECRET_NAMESPACE}

rm ${PEM_FOLDER}/key.pem ${PEM_FOLDER}/cert.pem