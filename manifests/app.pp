inode 'node3.codespaces.io' {
  
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
