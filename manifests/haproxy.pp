node 'node4.codespaces.io' {

  include ::haproxy
  haproxy::listen { 'lb-01':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  haproxy::balancermember { 'node1':
    listening_service => 'puppet00',
    server_names      => 'node1',
    ipaddresses       => '196.1.5.118',
    ports             => '8080',
    options           => 'check',
  }
  haproxy::balancermember { 'node2':
    listening_service => 'lb-01',
    server_names      => 'node2',
    ipaddresses       => '196.1.5.119',
    ports             => '8080',
    options           => 'check',
  }
}



