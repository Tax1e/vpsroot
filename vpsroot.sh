#!/bin/bash
# Mod By SL

# Download sshd_config and restart SSH service
wget -qO /etc/ssh/sshd_config https://raw.githubusercontent.com/Tax1e/vpsroot/refs/heads/main/sshd_config
systemctl restart sshd

clear
echo -e "Masukkan Password:"
read -e pwe

# Change root password securely
usermod -p "$(perl -e 'print crypt("'"$pwe"'", "Q4")')" root

clear
printf "Mohon Simpan Informasi Akun VPS Ini
============================================
Akun Root (Akun Utama)
Ip address = $(curl -Ls http://ipinfo.io/ip)
Username   = root
Password   = $pwe
============================================\n"
exit