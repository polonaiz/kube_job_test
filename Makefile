all: clean context create status wait status logs

watch:
	kubectl get job --watch

clean:
	-kubectl delete job heavy-job

context:
	kubectl config current-context

create:
	kubectl create -f job.yaml

status:
	kubectl get job heavy-job
	kubectl get pod 

wait:
	kubectl wait \
		--for=condition=complete \
		--timeout=20s \
		job/heavy-job

logs:
	kubectl logs job/heavy-job