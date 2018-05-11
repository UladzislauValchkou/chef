name "jbossrole"
run_list "recipe[jboss]"
env_run_lists "chef-dev" => ["recipe[jboss]", "recipe[jboss::start]", "recipe[jboss::deploy]"], "_default" => []

