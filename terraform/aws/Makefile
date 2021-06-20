

create_bucket:
	aws s3api create-bucket --bucket k8s-cluster-terraform-state-store --region us-east-1 > /dev/null

list_buckets:
	aws s3 ls

set_bucket_versioning:
	aws s3api put-bucket-versioning --bucket k8s-cluster-terraform-state-store --region us-east-1 --versioning-configuration Status=Enabled > /dev/null

export_kops_terrafor_file:
	kops create cluster \
	  --name=kubernetes.dusanstojnic.com \
	  --state=s3://k8s-cluster-terraform-state-store \
	  --dns-zone=dusanstojnic.com \
	  --cloud aws \
	  --master-size t2.medium \
	  --master-count 1 \
	  --master-zones us-east-1a \
	  --node-size t2.medium \
	  --node-count 1 \
	  --zones us-east-1a,us-east-1b,us-east-1c \
	  --ssh-public-key ~/.ssh/id_rsa.pub \
	  --out=. \
	  --target=terraform

terraform_install:
	terraform init
	terraform plan
	terraform apply -auto-approve

export_kops_cluster:
	kops export kubecfg kubernetes.dusanstojnic.com --state=s3://k8s-cluster-terraform-state-store

start:
	make create_bucket
	make list_buckets
	make set_bucket_versioning
	make export_kops_terrafor_file || true
	make terraform_install
	make export_kops_cluster

stop:
	terraform plan -destroy
	terraform destroy -auto-approve
	kops delete cluster --state=s3://k8s-cluster-terraform-state-store --name=kubernetes.dusanstojnic.com --yes
