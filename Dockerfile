FROM openjdk:8

MAINTAINER delivery-engineering@netflix.com

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test && \
  dpkg -i ./igor-web/build/distributions/*.deb && \
  cd .. && \
  rm -rf workdir

CMD ["/opt/igor/bin/igor"]
