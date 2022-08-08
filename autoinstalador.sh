#!/bin/bash


echo "La arquitectura es armv7?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

              curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_armv7.tar.gz"

              mkdir lazydocker-temp
              tar xf lazydocker.tar.gz -C lazydocker-temp
              mv lazydocker-temp/lazydocker /usr/local/bin
              lazydocker --version
              rm -rf lazydocker.tar.gz
              rm -rf lazydocker-temp; break;;

        No ) clear && echo "Es x86?"
             select yn in "Yes" "No"; do
                 case $yn in
                      Yes ) LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

                            curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"

                            mkdir lazydocker-temp
                            tar xf lazydocker.tar.gz -C lazydocker-temp
                            mv lazydocker-temp/lazydocker /usr/local/bin
                            lazydocker --version
                            rm -rf lazydocker.tar.gz
                            rm -rf lazydocker-temp; break;;
                      No ) exit;;
                 esac
              done;;
    esac
done
