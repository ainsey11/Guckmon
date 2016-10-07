<?php

## Have a look in includes/defaults.inc.php for examples of settings you can set here. DO NOT EDIT defaults.inc.php!

// Database config
$config['db_host'] = '10.1.1.51';
$config['db_user'] = 'observium';
$config['db_pass'] = 'observer15th3b055';
$config['db_name'] = 'observium';

// Base directory
$config['install_dir'] = "/opt/observium";

// Default community list to use when adding/discovering
$config['snmp']['community'] = array("public");

// Authentication Model
$config['auth_mechanism'] = "mysql";    // default, other options: ldap, http-auth, please see documentation for config help

// Enable alerter (not available in CE)
#$config['poller-wrapper']['alerter'] = TRUE;

// Set up a default alerter (email to a single address)
$config['alerts']['alerter']['default']['descr']   = "Observium Email Alert";
$config['alerts']['alerter']['default']['type']    = "";
$config['alerts']['alerter']['default']['contact'] = "robert@ainsey11.com";
$config['alerts']['alerter']['default']['enable']  = TRUE;

$config['autodiscovery']['ip_nets'] = array("10.1.0.0/", "10.2.0.0/16");  // Networks to permit autodiscovery
$config['autodiscovery']['xdp']            = TRUE; // Autodiscover hosts via discovery protocols
$config['autodiscovery']['ospf']           = TRUE; // Autodiscover hosts via OSPF
$config['autodiscovery']['bgp']            = TRUE; // Autodiscover hosts via iBGP
$config['autodiscovery']['snmpscan']       = TRUE; // autodiscover hosts via SNMP scanning
$config['discover_services']               = TRUE; ## Autodiscover services via SNMP on devices of type "server"
$config['enable_syslog']                        = 0; # Enable Syslog

$config['page_title']       = "Ainsey11 Observium";

$config['api']['enabled'] = 1;
$config['api']['module']['inventory']   = 1;    // enable or disable the inventory module
$config['api']['module']['billing'] = 1;    // enable or disable the billing module
$config['api']['module']['packages']    = 1;    // enable or disable the packages module

$config['geocoding']['api'] = 'google';             // Which GEO API use ('mapquest', 'google', 'openstreetmap', 'yandex')
$config['geocoding']['default']['lat'] =  "53.065039";         // Default latitude
$config['geocoding']['default']['lon'] =  "-0.797343";        // Default longitude


// End config.php

