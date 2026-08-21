#cloud-config

# 1. Configuration de base du système
hostname: AZA-Server
timezone: Europe/Paris
# locale: fr_FR.UTF-8
# keyboard:
#   layout: fr
#   variant: azerty

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
    defer: true
    content: |
      ${indent(6, private_key_pull)}

  - path: /home/ansible/.ssh/id_rsa.pub
    owner: ansible:ansible
    permissions: '0644'
    defer: true
    content: |
      ${indent(6, pub_key_pull)}

  - path: /home/ansible/.ssh/config
    owner: ansible:ansible
    permissions: '0600'
    defer: true
    content: |
      Host github.com
        Hostname github.com
        IdentityFile ~/.ssh/id_rsa
        IdentitiesOnly yes
        StrictHostKeyChecking accept-new

# Mise à jour des paquets existants
package_update: true
package_upgrade: true

# Paquets à installer
packages:
  - curl
  - vim
  - git
  - python3-pip

# 3. Sécurité globale de la machine
ssh_pwauth: false

ansible:
  install_method: distro
  package_name: ansible-core
  run_user: ansible
  pull:
    url: git@github.com:ZakFormTP/Ansible-Pull.git
    checkout: main
    playbook_name: playbook.yml

cloud_final_modules:
  - package-update-upgrade-install
  - write-files-deferred
  - scripts-user
  - ansible


