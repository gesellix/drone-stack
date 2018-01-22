# Drone CI as Docker Stack (in Swarm mode)

Example setup of [Drone CI](https://github.com/drone/drone) in a Docker Stack using Swarm mode.

## Usage 

Simplest usage is by running the `deploy.sh` script after configuring the agent and server settings:

    git clone https://github.com/gesellix/drone-stack
    cd drone-stack
    vi .server-env
    vi .agent-env
    ./deploy.sh

The script prepares a Docker volume for the Drone server's database and initializes your
Docker engine in Swarm mode. Via `docker stack deploy` the complete stack with server and agents
will be deployed to your Docker engine.

The Drone CLI is also available as Docker image and can be used like this:

    docker run --rm -it -e DRONE_SERVER=http://example.com:8000 -e DRONE_TOKEN=foo.bar.baz drone/cli info

## Security notice about credentials/tokens

Beware that your secrets are saved in `.agent-env` and `.server-env`.
After [drone/#2223](https://github.com/drone/drone/issues/2223) being implemented,
both files (or parts of them) should be converted to Docker secrets.

## GitHub integration

For the GitHub integration you'll need to create an OAuth App at https://github.com/settings/developers.
The _Homepage URL_ should point to your Drone server (e.g. http://example.com:8000),
the _Authorization callback URL_ should append `/authorize` (e.g. http://example.com:8000/authorize).

Due to the initial OAuth flow, the Drone CI server needs to be publicly available at _example.com:8000_.

## Contribution and feedback

Feel free to [file an issue](https://github.com/gesellix/drone-stack/issues)
or [create a pull request](https://github.com/gesellix/drone-stack/pulls) if you have questions or
if you'd like to improve this example setup!
