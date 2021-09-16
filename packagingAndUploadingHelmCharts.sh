#!/bin/zsh
sourcePath="/Users/behnam/ngvoice/repos/bitbucket/helm-charts/"
destPath="/Users/behnam/ngvoice/repos/k8s/github-helm-repo/argocd-demo/charts"

for chart in b2bua cscf-configuration-controller cscf-controller icscf local-path-provisioner mysql powerdns-recursor powerdns-server scscf srvcc test whereabouts
do
        echo "$chart"
        helm package $sourcePath$chart -d $destPath
done

helm repo index charts
git add charts
