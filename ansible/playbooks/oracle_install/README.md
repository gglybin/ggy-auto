# Oracle Database Installation :rocket:

> :heavy_exclamation_mark: This is for test/dev environments only.

## Estimate Time

~ 40-60 mins

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

# NOTE: "remote_tmp" should have at least 3.5-4 GB free space (actually depends on your ORACLE_HOME archive size).
remote_tmp             = /tmp
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

You have to copy real Oracle Home archive into `/etc/ansible/roles/ora_install/files` folder or create symbolic link.

Please review additional instructions in file `/etc/ansible/roles/ora_install/files/LINUX.X64_193000_db_home.zip`.

It's not an archive, so you can open it as regular file `view /etc/ansible/roles/ora_install/files/LINUX.X64_193000_db_home.zip` and review details.

### Step 6: Check free space on "remote_tmp" directory

You have to check if there is enough free space in directory defined on `Step 2` in `ansible.cfg` file as `remote_tmp` to place the ORACLE_HOME archive.

### Step 7: Setup passwordless ssh

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

### Step 8: Test if everything is okay

##### From Ansible host:

```
$ ansible db_ora_install -m shell -a "hostname && whoami"
$ ansible db_ora_install -m shell -a "hostname && whoami" -b
```

## II. Adjust playbook variables (if required)

##### From Ansible host:

```
$ view /etc/ansible/playbooks/oracle_install/vars.yml
```

:point_right: There is "Control flags" section in `vars.yml` file. You can enable or disable some playbook phases using these flags.

## III. Start installation process

##### From Ansible host:

```
$ ansible-playbook /etc/ansible/playbooks/oracle_install/oracle_install.yml
```
