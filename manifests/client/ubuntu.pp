class nfs::client::ubuntu (
  $nfs_v4 = false,
  $nfs_v4_idmap_domain = undef
) {

  include nfs::client::ubuntu::install,
    nfs::client::ubuntu::configure,
    nfs::client::ubuntu::service

}
