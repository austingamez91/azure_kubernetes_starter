# azure_kubernetes_starter
A starter project for kubernetes, azure, terraform, and fastapi

Some useful commands:

View current context	kubectl config current-context
Switch context	kubectl config use-context <name>
Get all contexts	kubectl config get-contexts
Set default namespace	kubectl config set-context --current --namespace=<ns>
Get pods	kubectl get pods
Get services	kubectl get svc
View all namespaces	kubectl get ns
Get all pods (all namespaces)	kubectl get pods --all-namespaces
Describe pod	kubectl describe pod <pod-name>
View pod logs	kubectl logs <pod-name>
Exec into pod (shell)	kubectl exec --stdin --tty <pod-name> -- /bin/sh
Expose pod (public)	kubectl expose deployment <name> --port=80 --target-port=80 --type=LoadBalancer
Apply YAML	kubectl apply -f <file>.yaml
Delete pod	kubectl delete pod <pod-name>
Watch resources	watch kubectl get pods / svc

az — Azure CLI
Action	Command
Login	az login
Set subscription	az account set --subscription "<id>"
List resource groups	az group list -o table
Delete resource group	az group delete --name <rg> --yes --no-wait
Get AKS credentials	az aks get-credentials --resource-group <rg> --name <cluster>
Attach ACR to AKS	az aks update --name <aks> --resource-group <rg> --attach-acr <acr>

az acr — Azure Container Registry
Action	Command
Create ACR	az acr create --resource-group <rg> --name <acr> --sku Basic --admin-enabled true
List ACR login servers	az acr list --resource-group <rg> --query "[].loginServer" -o tsv
Login to ACR	az acr login --name <acr>

docker — Local Docker
Action	Command
Build image	docker build -t <name> .
Tag for ACR	docker tag <image> <acr>.azurecr.io/<image>:latest
Push to ACR	docker push <acr>.azurecr.io/<image>:latest

terraform — Infrastructure as Code
Init project	terraform init
Plan changes	terraform plan
Apply infrastructure	terraform apply
Destroy infrastructure	terraform destroy
Use var file	terraform apply -var-file="terraform.tfvars"
Clean broken context	kubectl config delete-context <name>


Flow Summary:
terraform apply → Creates AKS, ACR, RG
az acr login, docker push → Push FastAPI to ACR
az aks get-credentials → Connect kubectl to AKS
kubectl apply or kubectl create deployment → Deploy app
kubectl expose deployment → Get public IP
curl http://<external-ip>/healthz → Test live endpoint

