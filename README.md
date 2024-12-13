# Automação de Instalação e Configuração do Zabbix com Shell Script

## Objetivos do projeto:
1. Praticar a criação de ambientes de virtualização utilizando Vagrant.
2. Automatizar a instalação do MySQL e do Zabbix Server.
3. Garantir que os serviços do MySQL e Zabbix Server estão configurados e funcionando corretamente.

## Descrição
O Vagrantile configura a máquina virtual com o nome de "Ubuntu-03" e excuta um script shell ('zabbix.sh') que irá provisionar a instalação do [Zabbix](https://zabbix.com) em seu sistema. Para o funcionamento do Zabbix, é necessário também a instalação do MySQL, que também está contido no script.

## Passo a passo para rodar a VM

1. Certifique-se de ter instalado em sua máquina local o [VirtualBox](https://www.virtualbox.org/) e o [Vagrant](https://www.vagrantup.com/).
2. Clone o repositório e acesse a sua pasta com o terminal.
3. Antes de iniciar o projeto, é necessário alterar o nome da sua placa de rede (parâmetro 'bridge' dentro do Vagrantfile).
4. Feito isso, inicie a máquina virtual utilizando o comando ``` vagrant up ``` em seu terminal.
5. Durante a execução do script 'zabbix.sh', o terminal irá retornar algumas mensagens incluídas no script de instalação.
6. Uma vez iniciada, realize o acesso via ssh com o comando ``` vagrant ssh ```.
7. Para conferir se tudo está instalado corretamente, passe os dois comandos a seguir ``` sudo systemctl status zabbix-proxy ``` e ``` sudo systemctl status mysql ```, e confira se os serviços estão ativos.