#cloud-config

# 1. Configuration de base du système
hostname: Zak-Server
timezone: Europe/Paris
locale: fr_FR.UTF-8
keyboard:
  layout: fr
  variant: azerty

# Utilisateurs à créer
users:
  - name: zak
    groups: [sudo, admin]
    shell: /bin/bash
    homedir: /home/zak

    # Étape A : Ajoutez votre mot de passe chiffré (généré avec Python)
    passwd: "$6$t3laEUCs2a9Is8KW$/His17LTw12HH88z7CRcZC6/gXazhofRL/TDeySpKJld8QpCkH2eCh29OYtFLh2QWemdHykpA7mlufHSLI931/"
    lock_passwd: false  # Permet au mot de passe d'être actif

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
ssh_pwauth: true

