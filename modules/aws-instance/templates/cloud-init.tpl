#cloud-config

# 1. Configuration de base du système
hostname: AZA-Server
timezone: Europe/Paris
locale: fr_FR.UTF-8
keyboard:
  layout: fr
  variant: azerty

# Utilisateurs à créer
users:
  - name: zak
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${zak_ssh_public_key}
    passwd: "$6$t3laEUCs2a9Is8KW$/His17LTw12HH88z7CRcZC6/gXazhofRL/TDeySpKJld8QpCkH2eCh29OYtFLh2QWemdHykpA7mlufHSLI931/"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL

  - name: aziz
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${aziz_ssh_public_key}
    passwd: "$6$t3laEUCs2a9Is8KW$/His17LTw12HH88z7CRcZC6/gXazhofRL/TDeySpKJld8QpCkH2eCh29OYtFLh2QWemdHykpA7mlufHSLI931/"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL

  - name: aya
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${aya_ssh_public_key}
    passwd: "$6$t3laEUCs2a9Is8KW$/His17LTw12HH88z7CRcZC6/gXazhofRL/TDeySpKJld8QpCkH2eCh29OYtFLh2QWemdHykpA7mlufHSLI931/"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${ssh_public_key}
    sudo: ALL=(ALL) PASSWD:ALL


# Mise à jour des paquets existants
package_update: true
package_upgrade: true

# Paquets à installer
packages:
  - curl
  - nano


# 3. Sécurité globale de la machine
ssh_pwauth: false

runcmd:
  - chmod 700 /home/aya
  - chmod 700 /home/aziz
  - chmod 700 /home/zak
