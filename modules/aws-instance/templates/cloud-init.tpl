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

  - name: aziz
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${aziz_ssh_public_key}
    passwd: "$6$t3laEUCs2a9Is8KW$/His17LTw12HH88z7CRcZC6/gXazhofRL/TDeySpKJld8QpCkH2eCh29OYtFLh2QWemdHykpA7mlufHSLI931/"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL


  - name: ansible
    groups: sudo
    shell: /bin/bash
    lock_passwd: true
    sudo: ALL=(ALL) NOPASSWD:ALL

# Mise à jour des paquets existants
package_update: true
package_upgrade: true

# Paquets à installer
packages:
  - curl
  - nano
  - git

write_files:
  - path: /home/ansible/.ssh/id_ed25519
    owner: ansible:ansible
    permissions: '0600'
    defer: true
    content: |
      ${indent(6, trimspace(ansible_private_key))}

  - path: /home/ansible/.ssh/config
    owner: ansible:ansible
    permissions: '0600'
    defer: true
    content: |
      Host github.com
        User git
        IdentityFile /home/ansible/.ssh/id_ed25519
        StrictHostKeyChecking no


# 3. Sécurité globale de la machine
ssh_pwauth: false

ansible:
  install_method: distro
  run_user: ansible
  pull:
    url: "${ansible_repo_url}"
    playbook_name: site.yml

runcmd:
  - chmod 700 /home/aziz
