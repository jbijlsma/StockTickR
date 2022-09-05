# Getting Started

Make sure you created a k8s cluster using the k8s-certs project.

The install this app in local cluster:

```
./deploy_local.sh
```

The install this app in the cluster with:

```
cd ./k8s/helm
helm upgrade stock-tickr . --install
```

Add to /etc/hosts file:

```
127.0.0.1 stock-tickr.dotnet-works.com
```

The browse to:

```
https://stock-tickr.dotnet-works.com
```
