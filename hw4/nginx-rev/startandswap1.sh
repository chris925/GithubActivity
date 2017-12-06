function killitif {
    docker ps -a  > /tmp/yy_xx$$
    if grep --quiet $1 /tmp/yy_xx$$
     then
     echo "killing older version of $1"
     docker rm -f `docker ps -a | grep $1  | sed -e 's: .*$::'`
   fi
}

docker-compose -f compose1.yml -p ecs189 up  &
sleep 10 && docker exec ecs189_proxy_1 /bin/bash /bin/swap1.sh
killitif web2


