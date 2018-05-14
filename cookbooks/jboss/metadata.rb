name 'jboss'
maintainer 'Uladzislau Valchkou'
maintainer_email 'uladzislau_valchkou@epam.com'
license 'All Rights Reserved'
description 'Installs/Configures jboss'
supports 'centos'
long_description 'Installs/Configures jboss'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'java'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/<insert_org_here>/jboss/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/<insert_org_here>/jboss'
