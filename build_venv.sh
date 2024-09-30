#!/bin/bash

ml cuda/11.3
ml cudnn
ml nccl

module load intel/19.0.5
module load impi/19.0.5
module load phdf5
module load gcc/9.1.0
module load python3/3.8.2
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH

# Create and activate virtual environment
python3 -m virtualenv venv-frontera-gpu
source venv-frontera-gpu/bin/activate

# Check Python version
which python

# Upgrade pip
python -m pip install --upgrade pip

# Install PyTorch with CUDA 11.3 support
python -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1+cu113 -f https://download.pytorch.org/whl/torch_stable.html

# Install other dependencies
python -m pip install -r requirements.txt