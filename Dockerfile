FROM openjdk:8-jre


RUN apt-get update \
	&& apt-get -y install \
		ffmpeg \
		imagemagick \
		ghostscript \
		libimage-exiftool-perl \
		dcraw \
		ufraw \
		gpac \
    && apt-get autoremove -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

# Install Razuna
RUN cd /opt \
    && curl -sL "http://razuna.org/razuna-tomcat.cfm?v=1.9.6" > razuna.zip \
    && unzip razuna.zip \
    && mv razuna_tomcat_1_9_6 razuna

EXPOSE 8080

WORKDIR /opt/razuna/tomcat/bin

CMD ["./catalina.sh", "run"]