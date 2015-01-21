# docker-bitchx
BitchX via Docker 

using ubuntu:14.10
@TODO use more minimal linux image

## Build

    docker build -t bitchx .

## Run

When running you can use all available parameters. 

### Get available parameters 

    docker run -it bitchx --help

### Run using current user configuration

    docker run -u $(id -u) -v ${HOME}/.BitchX:/root/.BitchX -it bitchx -n ${USER} [parameters]

 * `-n ${USER}` changes irc user `root` to the current user; saying you are root exposes you to script kiddies.
 * `-v ${HOME}/.BitchX:/root/.BitchX` allows custom configuration (@TODO also support `~/.ircrc` etc)
  
 
