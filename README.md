# Drone.io Docker Stack

Example setup of [Drone CI](https://github.com/drone/drone) in a Docker Stack using Swarm mode.

## Usage 

Simplest usage is by running the `deploy.sh` script:

    ./deploy.sh

## Security notice about credentials/tokens

Beware that your secrets will be read from `.agent-env` and `.server-env`.
After https://github.com/drone/drone/issues/2223 being implemented, both files (or parts of them)
should be converted to Docker secrets.

## GitHub integration

For the GitHub integration you'll need to create an OAuth App at https://github.com/settings/developers.
The _Homepage URL_ should point to your Drone server (e.g. http://example.com:8000),
the _Authorization callback URL_ should append `/authorize` (e.g. http://example.com:8000/authorize).
