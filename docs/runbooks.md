# Operations Runbook

## Deployment Procedure

1. Push code to GitHub.
2. Jenkins automatically triggers the pipeline.
3. Maven builds the application.
4. SonarQube performs static code analysis.
5. Docker image is built.
6. Image is pushed to Amazon ECR.
7. Terraform provisions infrastructure if required.
8. Kubernetes deploys the updated application.

---

# Rollback Procedure

If deployment fails:

1. Identify the previous stable Docker image.
2. Update the deployment image.
3. Apply the deployment.
4. Verify pod health.

Example:

kubectl rollout undo deployment enterprise-product-app -n qa

---

# Scaling Procedure

Increase replicas:

kubectl scale deployment enterprise-product-app --replicas=4 -n qa

Verify:

kubectl get deployment -n qa

---

# Incident Response

## Jenkins Failure

Diagnosis

sudo systemctl status jenkins

Recovery

sudo systemctl restart jenkins

---

## Maven Failure

Diagnosis

Review Jenkins build logs.

Recovery

Correct pom.xml dependencies and rerun the pipeline.

---

## Docker Registry Failure

Diagnosis

Verify Amazon ECR login.

Recovery

aws ecr get-login-password

Reconnect Jenkins and retry image push.

---

## Terraform State Corruption

Diagnosis

Terraform state unavailable.

Recovery

Restore the latest S3 version.

---

## Kubernetes Node Failure

Diagnosis

kubectl get nodes

Recovery

Create a replacement node group.

---

## AWS Region Outage

Recovery

Deploy infrastructure in a secondary AWS region.

---

## Certificate Expiration

Diagnosis

TLS certificate expired.

Recovery

Generate a new certificate.

Update Kubernetes Secret.

Restart Ingress if required.

---

# Health Checks

kubectl get nodes

kubectl get pods -A

kubectl get deployment -A

kubectl get svc -A

kubectl get ingress -A

kubectl top nodes

kubectl top pods

---

# Backup Procedure

- Automated RDS backups
- Manual deployment snapshots
- Terraform state versioning

---

# Recovery Objectives

RTO

15–30 minutes

RPO

Near zero using deployment snapshots