node 'node1.codespaces.io' {
  
  include base
  class {'tomcat':
    xms => "54m",
    xmx => "120m",
    group => "tomcat",
    maxpermsize => "130M",
    shutdown_wait => "40"
  }     

  
  tomcat::deploy {"SampleWebApp":
    deploy_url => "https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war",
    checksum_value => '9276c39974421ecf930e72e39b0fb692',    
   } 
}

node default {
  notify{"checkppoint1":
    message => "****Default Block****"
  }
}

node 'node2.codespaces.io' {

  notify{"****Node2 Block ******":}
  include base
  class {'::tomcat':

    xms           => '70m',
    xmx           => '120m',
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => 'running'
  }
  tomcat::deploy {"SampleWebApp":
    deploy_url => "https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war",
    checksum_value => '9276c39974421ecf930e72e39b0fb692',
   }
    

}

