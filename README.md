[![Board Status](https://dev.azure.com/jackyao713911/1aefc37e-fcb0-4ee1-ace2-dc62de3257de/574ef8e2-2468-42d3-8ee4-52fc0739346e/_apis/work/boardbadge/3999b310-d315-40f5-822a-cd5c34495e90)](https://dev.azure.com/jackyao713911/1aefc37e-fcb0-4ee1-ace2-dc62de3257de/_boards/board/t/574ef8e2-2468-42d3-8ee4-52fc0739346e/Microsoft.RequirementCategory)
# LinuxAutoShell

# git config

git config --global user.email "jackyao713911@gmail.com"  



git config --global user.name "jyao"

## docker TZ config 

`-e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro`


## Linux 问题解决

### /usr/lib/rpm/redhat/redhat-hardened-cc1: No such file or directory

```
sudo dnf install redhat-rpm-config
```

### ruby
https://www.runoob.com/ruby/ruby-rubygems.html
```sh
gem sources --remove https://rubygems.org/
gem sources -a http://ruby.taobao.org/
```

### zlib is missing; necessary for building libxml2
```bash
install zlib-devel
```

### 安装 kind `·k8s in docker`

```bash
go env -w GO111MODULE=auto
go env -w GOPROXY=https://goproxy.cn,direct
GO111MODULE="on" go get sigs.k8s.io/kind

# ln -s 

ln -s $(go env GOPATH)/bin/kind /usr/bin

kind create cluster

```

```yml
kind: Cluster
apiVersion: kind.sigs.k8s.io/v1alpha3
kubeadmConfigPatches:
- |
  apiVersion: kubeadm.k8s.io/v1beta1
  kind: ClusterConfiguration
  metadata:
    name: config
  networking:
    serviceSubnet: 10.0.0.0/16
  imageRepository: registry.aliyuncs.com/google_containers
  nodeRegistration:
    kubeletExtraArgs:
      pod-infra-container-image: registry.aliyuncs.com/google_containers/pause:3.1
- |
  apiVersion: kubeadm.k8s.io/v1beta1
  kind: InitConfiguration
  metadata:
    name: config
  networking:
    serviceSubnet: 10.0.0.0/16
  imageRepository: registry.aliyuncs.com/google_containers
nodes:
- role: control-plane
- role: control-plane
- role: control-plane
- role: worker
- role: worker
- role: worker

```
> kind create cluster --name kind-3 --config k8s-cluster.yaml

