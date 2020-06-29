#needs to be run before this deploy container
docker network create --subnet=172.19.1.0/24 galapagos_net

echo "Please enter vivado install path"
read vivado_dir

echo "Please enter IP address in range 172.19.1.1 to 172.19.1.255"

docker run -ti -d --privileged=true galapagos_docker \
	   -d -v $vivado_dir:/opt/Xilinx \
	   -d -v /dev/ttyUSB1:/dev/ttyUSB1 \
	   -d -v /dev/ttyUSB2:/dev/ttyUSB2 \
	   -d -v /dev/ttyUSB3:/dev/ttyUSB3 \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
          # --net=host \
          # --rm \
          # --privileged = true \
          # -e DISPLAY=$DISPLAY \
          # -v /tmp/.X11-unix:/tmp/.X11-unix \
          # galapagos_docker_test
           bash

docker container ls


echo "Please enter vivado install path"
read vivado_dir



docker run --net mynet123 --ip 172.18.1.22 -it ubuntu bash \
	   -d -v $vivado_dir:/opt/Xilinx \
	   -d -v /dev/ttyUSB1:/dev/ttyUSB1 \
	   -d -v /dev/ttyUSB2:/dev/ttyUSB2 \
	   -d -v /dev/ttyUSB3:/dev/ttyUSB3 \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_docker
           bash

docker container ls