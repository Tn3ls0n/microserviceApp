Docker
Documentation
https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops

windows agent
docker build --tag "azp-agent:windows" --file "./azp-agent-windows.dockerfile" .

docker run -e AZP_URL="<Azure DevOps instance>" -e AZP_TOKEN="<Personal Access Token>" -e AZP_POOL="<Agent Pool Name>" -e AZP_AGENT_NAME="Docker Agent - Windows" --name "azp-agent-windows" azp-agent:windows

linux agent
docker build --tag "azp-agent:linux" --file "./azp-agent-linux.dockerfile" .

docker run -e AZP_URL="<Azure DevOps instance>" -e AZP_TOKEN="<Personal Access Token>" -e AZP_POOL="<Agent Pool Name>" -e AZP_AGENT_NAME="Docker Agent - Linux" --name "azp-agent-linux" azp-agent:linux

Steps
setup azure resources
terraform apply

push docker image to container registry
docker build --tag "azp-agent:linux" --file "./azp-agent-linux.dockerfile" .

TODO:
Upate main module file names.
Remove location from from subnet names.