# Oracle Database 19c Installation :rocket:

> :heavy_exclamation_mark: This is for test/dev environments only.

## Estimate Time

- db_storage_setup ~ 1  min
- db_server_setup ~ 3  min
- db_software_setup ~ 10 min 
- db_create_instance ~ 45 min
- db_crontab_scripts ~ 1 min
- cc_agent_setup ~ 5 min

TOTAL ~ 1h

## Compatibility

RedHat Releases 7, 8 (x86_64)

## I. Preparation

### Step 1: Ansible Install

##### From Ansible host:

```
$ yum install -y epel-release
$ yum install -y ansible
```
### Step 2: Define Ansible config file

##### From Ansible host:

```
$ cat /etc/ansible/ansible.cfg
+++++++++++++++++++
[defaults]
inventory              = /etc/ansible/hosts
log_path               = /etc/ansible/ansible.log
host_key_checking      = false
+++++++++++++++++++
```

### Step 3: Define Ansible inventory

##### From Ansible host:

```
$ cat /etc/ansible/hosts
+++++++++++++++++++
[db_ora_install]

192.168.152.100 ansible_ssh_user=admin
+++++++++++++++++++
```

:point_right: You have to set "ansible_ssh_user" variable to user with "sudo" permissions or define it to root.

##### From Target server

```
$ cat /etc/sudoers
+++++++++++++++++++
admin      ALL=(ALL)       NOPASSWD: ALL
+++++++++++++++++++
```

### Step 4: Copy ansible roles and playbook

Copy roles and playbook folders to your ansible server from GitHub as it is.

### Step 5: Copy Oracle Home zip

You have to copy real Oracle Home archive into `/etc/asnible/roles/db_software_setup/files` folder.

Please review additional instructions in file `/etc/asnible/roles/db_software_setup/files/LINUX.X64_193000_db_home.zip`.

It's not an archive, so you can open it as regular file `view /etc/asnible/roles/db_software_setup/files/LINUX.X64_193000_db_home.zip` and review details.

### Step 6: Setup passwordless ssh

##### From Ansible host:

```
$ ssh-keygen -b 2048 -t rsa 
$ cat ~/.ssh/id_rsa.pub
```

##### Insert TO Target host:

```
$ vi ~/.ssh/authorized_keys
$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/authorized_keys
$ chmod 755 ~
```

### Step 7: Test if everything is okay

##### From Ansible host:

```
$ ansible db_ora_install -m shell -a "hostname && whoami"
$ ansible db_ora_install -m shell -a "hostname && whoami" -b
```

## II. Adjust playbook variables (if required)

##### From Ansible host:

```
$ view /etc/ansible/playbooks/oracle_19c_install/vars.yml
```

:point_right: There is "Control flags" section in `vars.yml` file. You can enable or disable some playbook phases using these flags.

## III. Start installation process

##### From Ansible host:

```
$ ansible-playbook /etc/ansible/playbooks/oracle_19c_install/oracle_19c_install.yml
```
