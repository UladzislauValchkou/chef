name "webrole"
run_list "recipe[webserver]"
env_run_lists "chef-dev" => ["recipe[webserver]", "recipe[webserver::attach]", "recipe[webserver::detach]"], "_default" => ["recipe[webserver]"]
