#! /bin/bash

# Install utils
apt update
apt install -y wget curl unzip

# Install OpenMMLab
pip install -U openmim
mim install mmengine
mim install "mmcv>=2.0.0"

# Install mmsegmentation
git clone -b main https://github.com/open-mmlab/mmsegmentation.git
cd mmsegmentation
pip install -r requirements.txt
pip install -v -e .
cd -

# Install jupyter kernel
pip install ipykernel

# Fix mmcv version problem
patch -t mmsegmentation/mmseg/__init__.py < .devcontainer/mmseg.patch
