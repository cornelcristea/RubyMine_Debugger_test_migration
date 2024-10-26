@echo off

set "main_dir=%cd%\main"
set image_name=jetbrains_rubyme
set image_tag=v1
set containerName=ruby_app_container
set "command=/app/install.sh output.log 2>&1 && cat output.log"

docker build -f %main_dir%\Dockerfile -t %image_name%:%image_tag% .

docker run -it --name %container_name% %image_name%:%image_tag% %command%
