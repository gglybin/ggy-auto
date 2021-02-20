# PostgreSQL Database Installation :elephant:

> :heavy_exclamation_mark: This is for test/dev environments only.

## Estimate Time

10 min

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
remote_tmp             = /tmp
+++++++++++++++++++
```

### Step 3: Define Ansible inventory

##### From Ansible host:

```
$ cat /etc/ansible/hosts
+++++++++++++++++++
[db_pg_install]

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

### Step 4: Copy ansible role and playbook

Copy role and playbook folders to your ansible server from GitHub.

### Step 5: Setup passwordless ssh

##### From Ansible host:

```
$ ssh-keygen -b 2048 -t rsa
$ cat ~/.ssh/id_rsa.pub
```

##### Insert TO Target host:

```
$ mkdir -p ~/.ssh && vi ~/.ssh/authorized_keys
$ {
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 755 ~
}
```

### Step 6: Test if everything is okay

##### From Ansible host:

```
$ ansible db_pg_install -m shell -a "hostname && whoami"
$ ansible db_pg_install -m shell -a "hostname && whoami" -b
```

## II. Adjust playbook variables (if required)

##### From Ansible host:

```
$ view /etc/ansible/playbooks/postgresql_install/vars.yml
```

:point_right: There is "Control flags" section in `vars.yml` file. You can enable or disable some playbook phases using these flags.

## III. Start installation process

##### From Ansible host:

```
$ ansible-playbook /etc/ansible/playbooks/postgresql_install/postgresql_install.yml
```
