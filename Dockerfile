
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
ENV APP_NAME="Devops Level-1"
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
COPY html/  /usr/share/nginx/html

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