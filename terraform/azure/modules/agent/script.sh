username=${username}
host_name=${host_name}
ado_org=${ado_org}
ado_pat=${ado_pat}
ado_pool=${ado_pool}

su - $username -c "
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/3.220.5/vsts-agent-linux-x64-3.220.5.tar.gz
tar zxvf ./vsts-agent-linux-x64-3.220.5.tar.gz
su chmod -R 777 /myagent
"

su - $username -c "
./config.sh --unattended \
    --agent \"$host_name\" \
    --url \"$ado_org\" \
    --auth PAT \ 
    --token \"$ado_pat\" \ 
    --pool \"$ado_pool\" \
    --replace \
    --acceptTeeEula & wait $!
"

sudo /myagent/svc.sh install
sudo /myagent/svc.sh start
exit 0