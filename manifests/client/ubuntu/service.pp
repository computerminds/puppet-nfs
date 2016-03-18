class nfs::client::ubuntu::service {
  Service {
    require => Class['nfs::client::ubuntu::configure']
  }

  if $lsbdistcodename == 'precise' {
    service { 'portmap':
      ensure    => running,
      enable    => true,
      hasstatus => false,
    }
  }

  if $nfs::client::ubuntu::nfs_v4 {
    service { 'idmapd':
      ensure    => running,
      name      => 'nfs-common',
      subscribe => Augeas['/etc/idmapd.conf', '/etc/default/nfs-common'],
    }
  } else {
    service { 'idmapd': ensure => stopped, }
  }
}
