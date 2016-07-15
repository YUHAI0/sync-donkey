#!/usr/bin/expect -f
set host [ lindex $argv 0 ]
set cmd [ lrange $argv 1 100 ]

spawn ssh -p {{SSHPORT}} -t {{USERNAME}}@$host sudo $cmd
expect "{{USERNAME}}:"
send "{{PASSWORD}}\n"
interact
