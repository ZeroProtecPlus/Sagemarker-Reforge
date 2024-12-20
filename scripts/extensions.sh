#!/bin/bash
cd extensions/
repos=(
    "Akegarasu/sd-webui-model-converter"
    "viyiviyi/stable-diffusion-webui-zoomimage"
    "hako-mikan/sd-webui-supermerger"
    "gutris1/sd-hub"
    "NoCrypt/sd-fast-pnginfo"
    "Bing-su/adetailer"
    "DominikDoom/a1111-sd-webui-tagcomplete"
    "BlafKing/sd-civitai-browser-plus"
    "zanllp/sd-webui-infinite-image-browsing"
    "uwidev/sd_extension-prompt_formatter"
    "pkuliyi2015/multidiffusion-upscaler-for-automatic1111"
    "thomasasfk/sd-webui-aspect-ratio-helper"
)

# Clona todos los repositorios en un solo bucle
for repo in "${repos[@]}"; do
    git clone "https://github.com/$repo.git"
done

mv /.env /stable-diffusion-webui-reForge/extensions/sd-webui-infinite-image-browsing/.env