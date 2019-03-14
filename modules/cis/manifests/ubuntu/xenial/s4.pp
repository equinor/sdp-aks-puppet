# Ubuntu CIS 16.04 Section #4
class cis::ubuntu::xenial::s4 {
  # 4.1.1.1 and 4.1.2
  class { 'auditd':
    max_log_file => 20
  }

  # 4.1.4
  auditd::rule { 'Ubuntu CIS 16.04 4.1.4':
    content => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change
-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change
-a always,exit -F arch=b64 -S clock_settime -k time-change
-a always,exit -F arch=b32 -S clock_settime -k time-change
-w /etc/localtime -p wa -k time-change',
    order   => 4104,
  }

  # 4.1.5
  auditd::rule { 'Ubuntu CIS 16.04 4.1.5':
    content => '-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity',
    order   => 4105,
  }

  # 4.1.6
  auditd::rule { 'Ubuntu CIS 16.04 4.1.6':
    content => '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/network -p wa -k system-locale
-w /etc/networks -p wa -k system-locale',
    order   => 4106,
  }

  # 4.1.7
  auditd::rule { 'Ubuntu CIS 16.04 4.1.7':
    content => '-w /etc/apparmor/ -p wa -k MAC-policy
-w /etc/apparmor.d/ -p wa -k MAC-policy',
    order   => 4107,
  }

  # 4.1.8
  auditd::rule { 'Ubuntu CIS 16.04 4.1.8':
    content => '-w /var/log/faillog -p wa -k logins
-w /var/log/lastlog -p wa -k logins
-w /var/log/tallylog -p wa -k logins',
    order   => 4108,
  }

  # 4.1.11
  auditd::rule { 'Ubuntu CIS 16.04 4.1.11':
    content => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
    order   => 4111,
  }

  # 4.1.12 - Fetched from node with command: find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | grep -v "/var/lib/docker" | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }'
  auditd::rule { 'Ubuntu CIS 16.04 4.1.12':
    content => '-a always,exit -F path=/usr/lib/dbus-1.0/dbus-daemon-launch-helper -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/snapd/snap-confine -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/x86_64-linux-gnu/utempter/utempter -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/eject/dmcrypt-get-device -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/openssh/ssh-keysign -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/lib/policykit-1/polkit-agent-helper-1 -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/mlocate -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/expiry -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/newgidmap -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/newuidmap -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/at -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/screen -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/bsd-write -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/wall -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chsh -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/pkexec -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/chfn -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/mount.nfs -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/pam_extrausers_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/sbin/mount.cifs -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/ntfs-3g -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/ping -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/umount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/ping6 -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/fusermount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/mount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged
-a always,exit -F path=/bin/su -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged',
    order   => 4112,
  }

  # 4.1.14
  auditd::rule { 'Ubuntu CIS 16.04 4.1.14':
    content => '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete
-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    order   => 4114,
  }

  # 4.1.15
  auditd::rule { 'Ubuntu CIS 16.04 4.1.15':
    content => '-w /etc/sudoers -p wa -k scope
-w /etc/sudoers.d -p wa -k scope',
    order   => 4115,
  }

  # 4.1.16
  auditd::rule { 'Ubuntu CIS 16.04 4.1.16':
    content => '-w /var/log/sudo.log -p wa -k actions',
    order   => 4116,
  }

  # 4.1.17
  auditd::rule { 'Ubuntu CIS 16.04 4.1.17':
    content => '-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit arch=b64 -S init_module -S delete_module -k modules',
    order   => 4117,
  }

  # 4.3 - Not complete, only ensures logrotate is installed and running
  include logrotate
}
