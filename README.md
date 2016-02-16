## VPS

This setup is tested on Ubuntu 15.04 (64-bit) only.

### Locales

Sometimes VPS has no configured locales, you can test it by executing
`perl -e exit`. If it outputs some warnings, you should generate locales
by doing this:

```
echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale
locale-gen en_US.UTF-8
```

Logout, login, and then command `perl -e exit` should output nothing.

## Ansible

`ansible-playbook -i hosts playbook.yml --user root`
