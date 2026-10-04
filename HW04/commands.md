# ДЗ 4: пользователь, sudo, сценарий смены хоста, nginx

## 1. Создание пользователя
```bash
sudo adduser bob1      # создал пользователя (bob1, т.к. bob уже был создан ранее на уроках)
id bob1                # проверить
```

## 2. Добавление в группу sudo
```bash
sudo usermod -aG sudo bob1   # добавить в группу sudo
groups bob1                  # проверить
```

## 3. Сценарий смены имени хоста
```bash
su - bob1                               # перейти на пользователя bob1
nano /home/bob1/change_hostname.sh      # создать сценарий
```
Содержимое сценария:
```bash
#!/bin/bash
sudo hostnamectl set-hostname ubuntu24
sudo sed -i 's/^127\.0\.1\.1.*/127.0.1.1\tubuntu24/' /etc/hosts
echo "new name of the host: $(hostname)"
```
```bash
chmod 700 /home/bob1/change_hostname.sh   # выполнение только для владельца (-rwx------)
ls -l /home/bob1/change_hostname.sh       # проверить права
```

## 4. Запуск сценария
```bash
/home/bob1/change_hostname.sh   # запустить сценарий
hostname                        # проверить новое имя хоста
sudo reboot                     # перезагрузить, затем войти как bob1
```

## 5. nginx и открытые порты
```bash
sudo apt update
sudo apt install -y nginx net-tools   # nginx и netstat
systemctl status nginx                # статус службы
sudo netstat -tulpn                   # открытые порты (nginx на :80)
```
