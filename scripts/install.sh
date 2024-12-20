#!/bin/bash

# Clone Stable Diffusion reForge
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
cd stable-diffusion-webui-forge/

# Clone extensions
source /home/studio-lab-user/extensions.sh

echo "Installing extension dependencies (if any)"

list=$(find /home/studio-lab-user/stable-diffusion-webui-forge/extensions/*/ -name 'install.py')
for installscript in $list; do
    EXTNAME=$(echo $installscript | cut -d '/' -f 3)
    if $(jq -e ".disabled_extensions|any(. == \"$EXTNAME\")" config.json); then
        echo "Skipping disabled extension ($EXTNAME)"
        continue
    fi
    PYTHONPATH=${ROOT} python "$installscript"
done

cd ..
pip install -r requirements_versions.txt
python -c "from launch import prepare_environment; prepare_environment()" --skip-torch-cuda-test
pip uninstall -y huggingface-hub
pip install huggingface-hub==0.23.2 gdown aria2

rm -rf /home/studio-lab-user/tmp
rm -rf /home/studio-lab-user/stable-diffusion-webui-reForge/models/Stable-diffusion/tmp_models
ln -vs /tmp ~/tmp
ln -vs /tmp/models /home/studio-lab-user/stable-diffusion-webui-reForge/models/Stable-diffusion/tmp_models
mkdir -p /tmp/models

rm -rf /home/studio-lab-user/tmp/controlnet_models
mkdir -p /tmp/controlnet_models
ln -vs /tmp/controlnet_models /home/studio-lab-user/stable-diffusion-webui-reForge/models/ControlNet/

cd /home/studio-lab-user/
wget https://github.com/openziti/zrok/releases/download/v0.4.23/zrok_0.4.23_linux_amd64.tar.gz
mkdir zrok-conection
tar -xf ./zrok*linux*.tar.gz -C ./zrok-conection
mkdir -p ./zrok-conection/bin && install ./zrok-conection/zrok ./zrok-conection/bin
