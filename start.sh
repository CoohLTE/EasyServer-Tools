#!/bin/bash

apt update -qq
apt upgrade -y -qq
clear
echo "Baixando Pacotes Necessarios..."
sleep 3

apt install -qq wget curl figlet net-tools -y

menu() {
    clear
    figlet -c EasyServer Tools
    echo ""
    echo ""
    echo "Criado Pela CoohLTE"
    echo ""
    PS3="Escolha Uma Opcao: "
    cal=("Servidores Fisicos" "Sair")
    select x in "${cal[@]}"; do
        case $x in
        "Servidores Fisicos")
            clear
            bash <(curl -s http://storage.cchcloud.tk/r/menuFisico.sh)
            ;;
        "Sair")
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
}

menu
