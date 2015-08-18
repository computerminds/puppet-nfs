class nfs::client::ubuntu::install {

  package { 'rpcbind':
    ensure => installed,
  }

  Package['rpcbind'] -> Service['portmap']


  package { ['nfs-common', 'nfs4-acl-tools']:
    ensure => installed,
  }

}
