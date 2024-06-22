[windows_servers]%{ for ip in servers}
${ip.ssh_host} name=${ip.name} labip=${ip.tags}%{ endfor }

[windows_servers:vars]
ansible_user=Administrator
ansible_password= # Insert your password here
ansible_port=5985
ansible_connection=winrm
ansible_winrm_transport=ntlm
ansible_winrm_server_cert_validation=ignore
lab_domain=lab.local
