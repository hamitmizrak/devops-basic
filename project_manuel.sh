#!/bin/bash

echo "Nginx Docker Kurulumları"

# Global Variable
CLEANER="Temizleme"

# Permission
permission() {
    chmod +x countdown.sh
    chmod +x reboot.sh
}
#permission

# Clean
clean(){
    sleep 2
    echo -e "\n#### ${CLEANER} ####"
    read -p "Sistemdeki Gereksiz Dosyaların ve Bağımlılıklarını Temizlemek İster misiniz ? e/h " cleanResult
    if [[ $cleanResult == "e" || $cleanResult == "E" ]]; then
        echo -e "Gereksiz Paketlerden arta kalan veriler siliniyor..."

        # Geriye Say
        ./countdown.sh

        echo -e "#### Cleaning ####\n"
        apt-get autoremove -y
        apt autoclean

        echo -e "#### Gerekli Bağımlılıkları Yükleniyor ####\n"
        apt install -f
    else
        echo -e "Temizleme İşlemi Gerçekleşmedi"
    fi        
}
#clean

# Docker Compose
nginxDocker() {
    echo -e "Nginx Docker başlıyor...."
    # Eğer defaultta: daocker-compose.yml ise
    # docker-compose up
    # docker-compose up -d

    # Nginx-docker-compose.yml
    #docker-compose -f Nginx-docker-compose.yml up -d
    cd /nginx
    docker-compose -f Nginx-docker-compose.yml up -d
    cd ../
}
nginxDocker
