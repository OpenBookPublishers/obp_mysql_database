FROM mysql:5.5.60

RUN ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

RUN mkdir -p /var/lib/mysql-files && \
    chown mysql:mysql /var/lib/mysql-files && \
    chmod 700 /var/lib/mysql-files

VOLUME ["/docker-entrypoint-initdb.d"]

CMD ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci", "--skip-character-set-client-handshake", "--secure_file_priv=/var/lib/mysql-files"]
