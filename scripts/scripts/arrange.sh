#!/bin/sh

mkdir -p ~/Downloads/{videos,images,pdfs,archives,torrents,docs,code_related}

mv ~/Downloads/*.{webm,mp4,mkv} ~/Downloads/videos
mv ~/Downloads/*.{jpg,jpeg,webp,png,svg} ~/Downloads/images
mv ~/Downloads/*.{pdf,epub} ~/Downloads/pdfs
mv ~/Downloads/*.{gz,zip,rar,tgz} ~/Downloads/archives
mv ~/Downloads/*.torrent ~/Downloads/torrents
mv ~/Downloads/*.{pptx,docx,txt} ~/Downloads/docs
mv ~/Downloads/*.{diff,sh,py,yaml,yml,json} ~/Downloads/code_related
mv ~/Downloads/*.AppImage ~/Downloads/appimages
mv ~/Downloads/*.iso ~/Downloads/iso
