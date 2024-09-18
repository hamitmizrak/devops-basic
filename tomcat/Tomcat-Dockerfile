
# FROM: Çalıştıracağımız image gösteririr.
# İmage olarak ubuntu:20.04 kullandım
FROM ubuntu:20.04

# Bilgilendirme
LABEL maintaner="hamitmizrak@gmail.com"

# Çevresel Değişkenler
ENV APP_NAME="Ubuntu, apache Tomcat, JDK"
ENV VERSION="V1.0.0"
ENV PORT="http://localhost:1111"

# Çalıştırmak
RUN echo "App Name: $APP_NAME"
RUN echo "Version: $VERSION"
RUN echo "Port:1111 $PORT"

# Data Persist (Kalıcı Veri)
VOLUME /tmp 

# Tomcat konfigürasyon dosyasını kopyala
COPY ./tomcat/tomcat-users.xml /usr/local/tomcat/conf/
COPY ./tomcat/context.xml /usr/local/tomcat/webapps/manager/META-INF/

# Tomcat War Added
COPY ./webapps/sample.war /usr/local/tomcat/webapps


# Set environment variables for non-interactive installs
# ENV DEBIAN_FRONTEND=noninteractive komutu, Debian tabanlı sistemlerde (bu durumda Ubuntu) paket yönetim sistemi olan apt-get ile 
# çalışırken, etkileşimli soruları önlemek ve otomatik kurulumu sağlamak için kullanılır. Bu özellikle Dockerfile'da kullanışlıdır,
# çünkü Dockerfile işlemleri otomatik ve kesintisiz olmalıdır.
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenJDK 11 and necessary packages
RUN apt-get update && apt-get install -y openjdk-11-jre-headless curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables for Tomcat
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Create Tomcat directory
RUN mkdir -p $CATALINA_HOME

# Download and install Tomcat
RUN curl -L https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz -o /tmp/tomcat.tar.gz && \
    tar xzf /tmp/tomcat.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm /tmp/tomcat.tar.gz


# Expose the HTTP port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]

# HEALTHCHECK: Sağlık kontrolünü Eklesin
# HEALTHCHECK: Bu container çalışıyor mu ?
#--interval=30s : Sağlık kontrolünü her 30 saniye bir çalıştırsın
#--timeout=10s  : Sağlık kontrolünü tamamlanması için 10 saniye beklesin
# --start-period=5s : Konteyner başlatıldıktan sonra sağlık kontrolünü başlatması için 5 saniye beklesin
# --retries=3 \: Sağlık kontrolü başarısız olursa 3 defa deneme yapsın 
#CMD curl -f http://localhost:1111/ || exit 1 : Belirtilen url'de kontrol başarısız olursa HTTP 200 dışında yanıt versin ve çıkış kodu 1 olsun
# Sağlık durumunu kontrol için docker ps STATUS sutunda konteynarın durumuna bakabilirsin
# Konteynar sağlıklı çalışıyor mu
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
 CMD wget --quiet --tries=1 --spider http://localhost:1111 exit 1


# Dockerfile: Kendi image dosyalarımızı oluşturmak için
# Dockerfile Çalıştırma
# docker build -t image_name .

# docker build -t my_tomcat2 .
# docker build . => Image Adını yazmadan oluştur.

# Eğer Dockerfile isminden farklı bir isim kullanırsanız (-f) yazmalısınız
# docker build -t my_tomcat2  -f _2_Dockerfile .

# docker ps 
# docker run -d -p 2222:8080 --name tomcat-container my_tomcat2

# docker ps 
# docker ps -a
# docker container ls 
# docker container ls -a 
# curl localhost:2222

# winpty docker container exec -it tomcat-container bash
# ls -al 
# cd /usr/local/tomcat/bin
# shutdown.sh 

# docker container start my_tomcat2