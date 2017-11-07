img=$(docker run -dt \
  --name=chipwhisperer \
  -h chipwhisperer \
  --privileged \
  -p 5901:5901 \
  -v /dev/bus/usb:/dev/bus/usb -v /dev/snd:/dev/snd \
  -v /etc/localtime:/etc/localtime:ro \
  --env QT_GRAPHICSSYSTEM=native \
  chipwhisperer-env-latest)

docker exec "$img" udevadm control --reload-rules
docker exec -d "$img" /root/startx
