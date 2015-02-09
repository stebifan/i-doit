docker image for the open source CMDB [i-doit](http://www.i-doit.org).

== Build, then launch ==

```bash
# build the image
% sudo docker build -t i-doit https://github.com/Gubaer/docker-i-doit

# run the application. Replace <port> with a free port number on localhost.
% sudo docker run -p <port>:80 -t i-doit 
```

Point your brower to `http://localhost:<port>/i-doit` and complete the installation steps.


== Pull from docker hub, then launch ==

```bash
# pull from docker hub
% sudo docker pull gubaer/i-doit

# run the application. Replace <port> with a free port number on localhost.
% sudo docker run -p <port>:80 -t i-doit 
```

== Notes ==
Can be used to explore `i-doit`'s functionality and for evaluation purposes. 
The image is neither prepared nor tested for a production installation.






