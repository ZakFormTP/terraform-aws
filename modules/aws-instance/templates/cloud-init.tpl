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


  - name: ansible
    groups: sudo
    shell: /bin/bash
    sudo: "ALL=(ALL) NOPASSWD:ALL"

write_files:
  - path: /home/ansible/.ssh/id_rsa
    owner: ansible:ansible
    permissions: '0600'
    content: |
      ${private_key_pull}

runcmd:
  # - chmod 700 /home/aya
  # - chmod 700 /home/aziz
  - chmod 700 /home/zak

  - chmod 700 /home/ansible/.ssh
  - sudo -u ansible ssh-keyscan -H github.com >> /home/ansible/.ssh/known_hosts
  - chown ansible:ansible /home/ansible/.ssh/known_hosts

ansible:
  package_name: ansible-core
  install_method: distro
  pull:
    - url: git@github.com:ZakFormTP/Ansible-Pull.git
      playbook_names: [playbook.yml]



# Mise à jour des paquets existants
package_update: true
package_upgrade: true

# Paquets à installer
packages:
  - curl
  - nano
  - git


# 3. Sécurité globale de la machine
ssh_pwauth: false

