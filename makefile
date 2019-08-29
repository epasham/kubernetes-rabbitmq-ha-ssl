add-configmap:
	kubectl create -f rabbitmq-certs-configmap.yaml
	kubectl create -f rabbitmq-confs-configmap.yaml

add-rbac:
	kubectl create -f rabbitmq-rbac.yaml

install-rabbitmq:
	kubectl create -f rabbitmq-service.yaml
	kubectl create -f rabbitmq-deploy.yaml

config-all:
	kubectl create -f rabbitmq-certs-configmap.yaml
	kubectl create -f rabbitmq-confs-configmap.yaml
	kubectl create -f rabbitmq-rbac.yaml
	kubectl create -f rabbitmq-service.yaml
	kubectl create -f rabbitmq-deploy.yaml