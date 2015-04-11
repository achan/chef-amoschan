# tell chef about ssh service
service 'ssh' do
  provider Chef::Provider::Service::Upstart
  supports [:status, :restart]
end

# disable root login
# bash "disable root login" do
#   code <<-EOH
#     sed -i '/PermitRootLogin.*/d' /etc/ssh/sshd_config
#     echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
#   EOH
#   notifies :restart, "service[ssh]", :delayed
#   not_if "grep -xq 'PermitRootLogin no' /etc/ssh/sshd_config"
# end
# 
# # restrict login only to created user
# bash "restrict login only to created user" do
#   code <<-EOH
#     sed -i '/AllowUsers.*/d' /etc/ssh/sshd_config
#     echo 'AllowUsers #{node['user']['name']}' >> /etc/ssh/sshd_config
#   EOH
#   notifies :restart, "service[ssh]", :delayed
#   not_if "grep -xq 'AllowUsers #{node['user']['name']}' /etc/ssh/sshd_config"
# end
