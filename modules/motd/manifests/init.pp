class motd {

file_line {'motd': 
    line      => 'This is a message put in place by Puppet. Hello.',
    path      => '/etc/motd',
    ensure   => 'present',
}
}
