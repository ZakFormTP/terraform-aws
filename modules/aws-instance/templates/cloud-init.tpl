#cloud-config

# 1. Configuration de base du système
hostname: AZA-Server
timezone: Europe/Paris

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
  - vim
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
        Hostname github.com
        IdentityFile /home/ansible/.ssh/id_ed25519
        IdentitiesOnly yes
        StrictHostKeyChecking accept-new

# 3. Sécurité globale de la machine
ssh_pwauth: false

# 4. Activation du module ansible, absent de la liste par defaut sur Debian
cloud_final_modules:
  - package-update-upgrade-install
  - write-files-deferred
  - ansible
  - scripts-user

ansible:
  install_method: distro
  package_name: ansible
  run_user: ansible
  pull:
    url: "${ansible_repo_url}"
    playbook_name: site.yml