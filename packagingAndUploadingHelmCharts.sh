#!/bin/zsh
sourcePath="/Users/behnam/ngvoice/repos/bitbucket/helm-charts/"
destPath="/Users/behnam/ngvoice/repos/k8s/github-helm-repo/argocd-demo/charts"

helm dependency update $sourcePath/powerdns-server
helm dependency update $sourcePath/powerdns-recursor

for chart in b2bua cscf-configuration-controller cscf-controller icscf local-path-provisioner mysql powerdns-recursor scscf srvcc test whereabouts
do
        echo "$chart"
        helm package $sourcePath$chart -d $destPath
done

helm repo index charts
git add charts
