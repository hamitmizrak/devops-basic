
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  

# Image Create
# docker image build -t customize_nginx .

# Container Create
# docker container run -d -p 1111:80 --rm --name  customize_nginx

# Daocker Registery Create
# Step-1: Dockerfile ile image oluştur => docker image build -t customize_nginx .
# Step-2: DockerHub git public veya private repository oluştur.
# Step-3: docker ps
# Step-4: image Name: customize_nginx
# Step-5: docker image tag imageName javahamitmizrak/oluşturulmuşRepositoryAdi
# Step-5: docker image tag customize_nginx javahamitmizrak/oluşturulmuşRepositoryAdi
# Step-6: docker push javahamitmizrak/oluşturulmuşRepositoryAdi

# ÖNEMLİ NOT: eğer windows üzerinden çalıştırıyorsanız sudo tanımayacaktır.
# ÖNEMLİ NOT: nginx eğer browserda istediğiniz sonuç çıkmazsa browserin cache belleğini temizleyiniz. yoksa nginx'in kendi sayfasını görürüsünüz.


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
# IMAGE
# nginx Image
FROM nginx:latest

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# MAINTAINER
LABEL maintainer="hamitmizrak@gmail.com"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# ENVIRONMENT
# Ortam Değişkenleri
ENV AUTHOR="Hamit Mızrak"
ENV APP_NAME="Nginx,Html5,Css3,Js,Bootstrap5,Reverse Proxy"
ENV YEAR="2024"
ENV TECH="for devops"
ENV VERSION="v1.0.0"
ENV NGINX_HOST=localhost
ENV NGINX_PORT=80

# Ortam Değişkenleri Çalıştırmak
RUN echo "Yazar: $AUTHOR"
RUN echo "Uygulama: $APP_NAME"
RUN echo "Version: $VERSION"
RUN echo "Year: $YEAR"
RUN echo "Yazar: $AUTHOR"
RUN echo "URL: http://$NGINX_HOST:$NGINX_PORT"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# PERSIST
# Log Verisini sakla
VOLUME ["/var/log/nginx"]

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# COPY
# Local bilgisayarımdaki bilgileri Docker image dosyaları ile yer değiştirmek
COPY nginx/nginx.conf  /etc/nginx/nginx.conf 
COPY nginx/conf.d/default.conf /etc/nginx/default.conf
COPY /html/  /usr/share/nginx/html

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# EXPOSE
EXPOSE 80


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# HEALTHCHECK         ==> Bu image dosyasının sağlık durumu (Container Çalışıyor mu)
# --interval=30s      ==> 30 saniyede bir sağlık kontrolü yapılsın
# --timeout=10s       ==> 10 saniyede Sağlık kontrolünü tamamlasın
# --start-periyod=5s  ==> Konteynar başladığında sağlık kontrolünün başlamasın için 5 saniye bekle
# --retries=3         ==> Sağlık kontrolünü eğer ilk denemede başarısız olursa 3 defa daha  çalışsın.
# Eğer bu 3s komutu belirtilenin dışına çıkarsa Docker sağlıksız olarak işaretlenir
# CMD wget --quiet --tries=1 --spider http://localhost : wget ile localhost istek atmak
HEALTHCHECK --interval=30s --timeout=10s \
    --start-period=5s --retries=3 \
    CMD curl -f http://${NGINX_HOST}:${NGINX_PORT}/ || exit 1
#CMD wget --quiet --tries=1  --spider http://localhost:80 || exit 1

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# Güvenlik kısımlarında kullanıcı değiştirmek istersek ve root'u kullanmamak için
RUN useradd -r -s /bin/false nginxuser

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
# CMD
# CMD ["nginx", "-g","daemon off;"]
# CMD: Konteyner başlatıldığında varsayılan olarak çalışacak komutu söyler.
# Nginx başlatan komutlar
# nginx: nginx web sunucu çalıştıran komuttur
# -g : nginx'te global(genel) bir yapılandırma direktifidir.
# daemon off: Nginx varsayılan olarak daemon(arka plan işlemi) olarak çalışır 
# yani başlatıldığında kendi kendine arka plana gönderir ve kontrol terminalinden çıkar.
#ve Nginx'in arka planda çalışmasını engeller ve ana process olarak çalışmasını sağlar.

# Docker konteynar başlatıldığında çalışacak ve varsayılan komutunu belirtir.
# Bu komutla beraber Nginx web sunucusunuu başlatılmasını sağlar ve -g "daemon off" komutları daemon kontrolünden Nginx'in arka planda çalışmasını engeller.
# Çünkü docker container için önemlidir. Docker konteynarın çalışır durumda olduğunu anlamak için ana processn çalışmasını devam edip etmediğini kontrol eder.
CMD ["nginx", "-g","daemon off;"]

##########################################################################
# docker build -t imageName .  => (Defaultta: Dockerfile yazılmışsa)
# docker build -f CustomiseDockerFile -t imageName . => (Dockerfile yerine CustomiseDockerFile yazılmışsa)

# docker container prune

# docker ps
# docker ps -a
# docker container ls
# docker container ls -a
# docker image ls
# docker container run --detach --publish 1111:80 --rm --name nginx_container nginx:latest
# docker container run -d -p 1111:80 --rm --name nginx_container nginx:latest
# docker container stop nginx_container


# docker container exec -it containerID bash
# docker container exec -it containerNAME bash