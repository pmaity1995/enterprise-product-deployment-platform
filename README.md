# Enterprise Database Backup and Disaster Recovery Strategy

## Objective

To ensure business continuity and minimize data loss by implementing automated database backups, point-in-time recovery, and snapshot-based disaster recovery using Amazon RDS.

## Proposed Architecture

* Amazon RDS MySQL as the production database.
* Automated backups enabled with a 7-day retention period.
* Manual snapshots created immediately before production deployments.
* Snapshots stored in Amazon S3 using AWS managed storage.
* Encryption enabled using AWS KMS.
* Backup monitoring through Amazon CloudWatch.
* Infrastructure configuration managed with Terraform using remote state stored in Amazon S3 with versioning enabled.

## Backup Strategy

| Backup Type      | Frequency                          | Retention              |
| ---------------- | ---------------------------------- | ---------------------- |
| Automated Backup | Daily                              | 7 Days                 |
| Manual Snapshot  | Before every production deployment | Until manually deleted |
| Terraform State  | Every infrastructure change        | Versioned in Amazon S3 |

## Disaster Recovery Procedure

1. Detect database failure.
2. Select the latest automated backup or manual snapshot.
3. Restore a new RDS instance from the snapshot.
4. Update application configuration or DNS to point to the restored database.
5. Validate application functionality.
6. Resume production traffic.

## Rollback Strategy

Before every deployment, a manual RDS snapshot is created. If the deployment introduces application or database issues, the application is rolled back to the previous Docker image while the database can be restored from the latest snapshot if required.

## Recovery Objectives

* **Recovery Time Objective (RTO):** Approximately 15–30 minutes.
* **Recovery Point Objective (RPO):** Maximum data loss of 24 hours using automated backups, or near zero when restoring from a deployment snapshot.

## Justification

The backup strategy follows AWS best practices by combining automated backups, manual deployment snapshots, encrypted storage, and infrastructure versioning. This approach provides a reliable disaster recovery solution while minimizing operational risk.
