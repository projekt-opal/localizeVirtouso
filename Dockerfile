FROM openlink/virtuoso_opensource:vos
COPY virtuoso.ini /opt/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini
COPY import.sh /import.sh
EXPOSE 8890/tcp
EXPOSE 1111/tcp