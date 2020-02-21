# How to setup:

1. Authenticate in your k8s cluster

2. Generate the certificates:
	`$ cd tls-gen/basic
	$ make PASSWORD=<password> CN=<DNS name>`

3. Copy and paste the content of the certificates files to rabbitmq-configmap.yaml

	`$ cat tls-gen/basic/result/ca_certificate.pem
	$ cat tls-gen/basic/result/server_certificate.pem
	$ cat tls-gen/basic/result/server_key.pem`

4. Run:
	`$ make config-all`

5. Run the following command to get the endpoint to RabbitMQ:
	`$ kubectl get svc`

RabbitMQ will be available at the port 5671 with SSL authentication.

# To check if the HA is working:

`$ FIRST_POD=$(kubectl get pods -l 'app=rabbitmq' -o jsonpath='{.items[0].metadata.name }')
$ kubectl exec $FIRST_POD rabbitmqctl cluster_status`

The output should look something like this:

`Cluster status of node rabbit@10.28.1.16 ...
[{nodes,[{disc,['rabbit@10.28.1.16','rabbit@10.28.1.17',
                'rabbit@10.28.2.27']}]},
 {running_nodes,['rabbit@10.28.1.17','rabbit@10.28.2.27','rabbit@10.28.1.16']},
 {cluster_name,<<"rabbit@rabbitmq-0.rabbitmq.default.svc.cluster.local">>},
 {partitions,[]},
 {alarms,[{'rabbit@10.28.1.17',[]},
          {'rabbit@10.28.2.27',[]},
          {'rabbit@10.28.1.16',[]}]}]`

