#!/bin/bash
set -e
cd "$(dirname "$0")"

#### Deploy the core i2b2 cells
# Pre-deployment
cd ./edu.harvard.i2b2.server-common/
ant clean dist deploy jboss_pre_deployment_setup

# PM data
cd ../edu.harvard.i2b2.pm/
ant -f master_build.xml clean build-all deploy

# Admin files - install on web server
#cd ../
#cp -r admin /var/www/html/

# Ontology cell
cd ../edu.harvard.i2b2.ontology
ant -f master_build.xml clean build-all deploy

# CRC cell
cd ../edu.harvard.i2b2.crc
ant -f master_build.xml clean build-all deploy

# Workplace cell
cd ../edu.harvard.i2b2.workplace
ant -f master_build.xml clean build-all deploy

# File repository cell
cd ../edu.harvard.i2b2.fr
ant -f master_build.xml clean build-all deploy

# Identity management cell
cd ../edu.harvard.i2b2.im
ant -f master_build.xml clean build-all deploy


