# Установка Todo list – тестовое задание для Digital port 

## Установка Virtualbox и Vagrant
* Установка [virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Установка [vagrant](https://www.vagrantup.com/downloads.html)

## Копирование репозитория	
```bash
$ git clone https://github.com/gmaxus/digital_port.git
```
## Настройка Vagrant файла
В файле
```bash
/vagrant/Vagrantfile
```
Установите первый параметр – полный путь до развернутого репозитория на папку www, 
```bash
config.vm.synced_folder "/Users/maxus/Development/digital_port_tz/site/www", "/var/www/"
```

## Подготовка и запуск виртуальной машины
```bash
$ cd ../../vagrant
$ vagrant up
```

## Установка необходимых библиотек
```bash
$ vagrant ssh
$ cd /var/www 
$ composer install
```

## Просмотр приложения
[http://127.0.0.1:8080/](http://127.0.0.1:8080/)

##### известные баги/фичи:
* при возникновении ошибки, текст ошибки выводится в консоль
* при добавлении не завершённой задачи на вкладке завершённых – она добавляется как не завершённая вверх списка. и так же происходит со вкладкой активных задач.