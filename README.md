[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/infrastructr/git-server)](https://hub.docker.com/repository/docker/infrastructr/git-server/general)
[![Docker Pulls](https://img.shields.io/docker/pulls/infrastructr/git-server)](https://hub.docker.com/r/infrastructr/git-server)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/infrastructr/docker-git-server)](https://hub.docker.com/repository/docker/infrastructr/git-server/tags?page=1)

# Git Server
Docker based Git SSH server for testing purposes.

## Usage

1. Run Git server.    

       $ docker-compose up -d
    
2. Add local public SSH key to the server's `git` user.

       $ docker-compose exec git-server /bin/ash -c "echo '<ssh public key>' >> /home/git/.ssh/authorized_keys"

3. Create Git repository `foo`.
 
       $ docker-compose exec git-server /bin/ash -c "mkdir -p /git/foo && git init --bare /git/foo && chown -R git:git /git"

4. Clone Git repository `foo`.
 
       $ git clone ssh://git@localhost:2222/git/foo && cd foo

5. Commit and push to the Git repository `foo`.

       $ echo "baz" > bar && git add bar && git commit -m "baz into bar" && git push origin HEAD 

## Development
Run locally built image

    docker-compose up

Rebuild image

    docker-compose build

## Maintainers

- [build-failure](https://github.com/build-failure)

## License

See the [LICENSE.md](LICENSE.md) file for details
