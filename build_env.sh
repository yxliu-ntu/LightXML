# Name of the virtual environment
if [[ $# == 0 ]]; then
    ENV_NAME="twotower"
else
    ENV_NAME=$1
fi

# Creating a new conda environment
echo "Clean and Creating a new conda environment named $ENV_NAME"
conda activate base
conda remove -n $ENV_NAME --all --yes
conda create -n $ENV_NAME python=3.8 -y

# Activating the environment
echo "Activating the environment: $ENV_NAME"
conda activate $ENV_NAME

# Installing libraries in requirements.txt
echo "Installing libraries in requirements.txt"
#cat requirements.txt | xargs -n 1 -L 1 pip3 install
pip3 install -r requirements.txt
conda install pytorch==1.5.1 torchvision==0.6.1 cudatoolkit=10.2 -c pytorch --yes
#conda install nvidia-apex==22.03 -c conda-forge --yes

echo "Setup complete. Activate the conda environment using: conda activate $ENV_NAME"

