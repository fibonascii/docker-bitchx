# docker-bitchx
BitchX via Docker 

using ubuntu:14.10
@TODO use more minimal linux image

## Run

When running you can use all available parameters. 

### Get available parameters 

    docker run -it aubreyhewes/bitchx --help

### Run using current user configuration

    docker run -u $(id -u) -v ${HOME}/.BitchX:/root/.BitchX -e IRCNAME="docker-bitchx" -it aubreyhewes/bitchx -n ${USER} [parameters]

 * `-n ${USER}` changes irc nickname to current user from `root`.
 * `-v ${HOME}/.BitchX:/root/.BitchX` allows custom configuration (@TODO also support `~/.ircrc` etc)

## Build your own

    docker build -t aubreyhewes/bitchx .
  
 
