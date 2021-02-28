### k8s-images
mirror of k8s images in gcr

### 思路
由于在国能不能正常访问gcr.io，因此不能正常地拉取k8s相关的镜像。基于这样的事实，自定义了所有k8s相关的镜像并构建到docker hub中，这样可以通过docker hub拉取对于的镜像并修改tag为k8s对应的值，从而可以进行正常的使用。

### 使用方式
1. clone this repository
2. run pull_images.sh in bash