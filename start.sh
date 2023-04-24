#!/bin/bash

x="exitmenu"

apt update -qq
apt upgrade -y -qq
apt install -y -qq spinner
clear
echo "Baixando Pacotes Necessarios..."
sleep 3

spinner(){
    local pid=$1
    local delay=0.7
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $i}' | gep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

apt install -qq wget curl git figlet net-tools -y
spinner $!

menu() {
    while true $x != "exitmenu"
    do
        clear
        figlet -c EasyServer Tools
        echo ""
        echo ""
        echo "Criado Pela CoohLTE"
        echo ""
        PS3="Escolha Uma Opcao: "
        cal=("Auto Iptables Config" "Sair")
        select x in "${cal[@]}"; do
            case $x in
                1)
                    echo "Iniciando..."
                    clear
                    bash <(curl -s http://storage.cchcloud.tk/r/Iptables_AUTO.sh)
                ;;
                2)
                    echo "Saindo..."
                    sleep 2
                    clear
                    exit
                ;;
                *)
                    echo "Opcao Invalida!"
                ;;
            esac
        done
    done
}

menu