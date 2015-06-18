

docker rm -f mysql-magento

docker run -d\
    --name mysql-magento \
    -e MYSQL_ROOT_PASSWORD=admin \
    mysql

docker rm -f magento2
docker run \
    --name magento2 \
    -i -t \
    -p 80:80 \
    --link mysql-magento:mysql \
    -e PUBLIC_HOST=magento.ruebenramirez.com \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=admin \
    docker-magento2-demo-apache
