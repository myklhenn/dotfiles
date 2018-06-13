FROM ubuntu

RUN apt update
RUN apt install -y stow fish curl git neovim
WORKDIR ~
RUN mkdir .dotfiles
COPY . .dotfiles/
WORKDIR ~/.dotfiles
RUN ./link.sh