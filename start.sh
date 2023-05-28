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
    echo "Criado Pela CoohLTE"
    echo ""
    PS3="Escolha Uma Opcao: "
    cal=("Servidores Fisicos" "Servidores Cloud/Virtuais" "Sair")
    select x in "${cal[@]}"; do
        case $x in
        "Servidores Fisicos")
            clear
            bash <(curl -s https://us-east-1.tixte.net/uploads/storage.cchcloud.tk/menuFisico.sh)
            exit
            ;;
        "Servidores Cloud/Virtuais")
            clear
            echo "Em Breve"
            sleep 2
            menu
            ;;
        "Sair")
            echo "Saindo..."
            sleep 2
            clear
            exit
            ;;
        *)
            clear
            echo "Opcao Invalida!"
            sleep 1
            menu
            ;;
        esac
    done
}

menu
