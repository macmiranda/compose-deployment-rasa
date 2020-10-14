# Simple Flask app that greets you

## Getting started

In order to run this app in production you need to have `docker` and `docker-compose` installed. You also need `git` if you want to clone the repository directly onto your server.

To clone the repository, do:

    $ git clone https://github.com/macmiranda/flask-simple-service.git

To build and run the containers, do:

    $ docker-compose up -d

Optionally, you can spin up the same stack with Docker Swarm:

    $ docker stack deploy -c docker-compose.yml <your_stack_name>

Just replace `<your_stack_name>` with the actual name you want to use for this deployment. If you're running this in production with multiple nodes, uncomment the lines:

    #        placement:
    #        max_replicas_per_node: 1

The user running the command above needs write access to `/var/run/docker.sock`. That can be easily done by adding the user to the `docker` group or by running the command with `sudo`

That's it. Now you can tell the app to remember your name by creating a POST request to the service on port 9090 and passing it in the body of the request in JSON format, like so:

    S curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"Marco\"}" http://<your_server_ip>:9090
    
In order to check if the app actually remembers your name, just send it a GET request instead:

    S curl -X GET http://<your_server_ip>:9090

Make sure you replace `<your_server_ip>` with the appropriate IP address and that the port 9090 is open on your local firewall.

## Making changes to the code

If you change the code after the containers are running, you'll need to destroy them and rebuid, recreate them with the command:

    $ docker-compose down && docker-compose up -d --build
