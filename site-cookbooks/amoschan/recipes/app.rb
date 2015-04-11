deploy_home_path = "/home/#{node['user']['name']}"
deploy_bin_path = "#{deploy_home_path}/bin"

directory "#{deploy_home_path}/apps" do
  mode 0755
  owner node['user']['name']
  group node['group']
  recursive true
end

directory deploy_bin_path do
  mode 0755
  owner node['user']['name']
  group node['group']
  recursive true
end

template "#{deploy_bin_path}/setup_dropbox.sh" do
  source "setup_dropbox.sh.erb"
  mode 0755
  owner node['user']['name']
  group node['group']
end

template "#{deploy_bin_path}/install_dropbox.sh" do
  source "install_dropbox.sh.erb"
  mode 0755
  owner node['user']['name']
  group node['group']
end
