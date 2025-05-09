FROM node:22.8.0-bookworm-slim

RUN apt-get -y update && apt-get -y install ca-certificates apt-transport-https

RUN echo 'deb     [trusted=yes check-valid-until=no] https://snapshot.debian.org/archive/debian/20211201T215332Z/ buster main \n\
deb-src [trusted=yes check-valid-until=no] https://snapshot.debian.org/archive/debian/20211201T215332Z/ buster main \n\
deb     [trusted=yes check-valid-until=no] https://snapshot.debian.org/archive/debian-security/20211201T215332Z/ buster/updates main \n\
deb-src [trusted=yes check-valid-until=no] https://snapshot.debian.org/archive/debian-security/20211201T215332Z/ buster/updates main' >> /etc/apt/sources.list

RUN apt-get -y update && apt-get -y install liblog4j2-java=2.11.1-2

RUN addgroup --system --gid 1001 juicer && adduser juicer --system --uid 1001 --ingroup juicer
RUN git clone https://github.com/clintonherget/juice-shop juice
RUN chown juicer juice
WORKDIR ./juice
RUN npm install --production --unsafe-perm
RUN npm dedupe
RUN rm -rf frontend/node_modules
#RUN mkdir logs && \
#    chown -R juicer logs && \
#    chgrp -R 0 ftp/ frontend/dist/ logs/ data/ i18n/ && \
#    chmod -R g=u ftp/ frontend/dist/ logs/ data/ i18n/
USER 1001
EXPOSE 3000
CMD ["npm", "start"]
