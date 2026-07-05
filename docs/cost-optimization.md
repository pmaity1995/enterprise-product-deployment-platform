Cost Optimization Report

Project: Automated Enterprise Product Deployment Platform
Phase: Phase 3 – Scale & Optimization
Task: Cost Optimization using AWS Auto Scaling and Spot Instances

1. Objective

The objective of this phase was to reduce the operational cost of the enterprise application while maintaining high availability and scalability. This was achieved by implementing AWS Spot Instances together with Auto Scaling and AWS cost monitoring services.

2. Cost Optimization Techniques Implemented
A. Spot Instances
Objective

Reduce EC2 compute cost by utilizing unused AWS capacity.

Implementation
Created an EC2 Launch Template
Configured Spot Instance purchasing option
Created Version 3 of the Launch Template
Associated the Launch Template with an Auto Scaling Group
Configured Spot Instance as the compute capacity
Benefits
Spot Instances can reduce EC2 costs by up to 90% compared to On-Demand Instances.
Suitable for workloads that can tolerate interruptions.
Auto Scaling automatically replaces interrupted Spot Instances.
B. Auto Scaling Group
Configuration
Parameter	Value
Desired Capacity	1 Instance
Minimum Capacity	1
Maximum Capacity	3
Instance Type	t3.micro
Availability Zones	us-east-1a, us-east-1b
Health Check	EC2
Warm-up Time	300 Seconds
Scaling Policy

Target Tracking Policy

Metric: Average CPU Utilization
Target Value: 70%
Benefits
Automatically launches new instances when CPU utilization increases.
Automatically terminates unnecessary instances when demand decreases.
Prevents over-provisioning.
Optimizes infrastructure cost.
3. Auto Scaling Validation

To verify Auto Scaling functionality, CPU stress testing was performed.

Commands Used
sudo apt update
sudo apt install stress -y
stress --cpu 2 --timeout 600
Result

The Auto Scaling Group detected sustained CPU utilization above the configured threshold and automatically launched additional EC2 instances.

Observed Scaling:

Initial Instances	After Load
1	2
2	3

AWS Activity History confirmed:

New EC2 instance launched
Desired capacity increased
Auto Scaling policy executed successfully
4. Cost Anomaly Detection

AWS Cost Anomaly Detection was configured to monitor unexpected increases in cloud spending.

Configuration
AWS Cost Anomaly Detection Enabled
SNS Notifications Configured
Email Alerts Enabled
Benefits
Early detection of abnormal spending
Prevents unexpected AWS bills
Automated notifications for cost anomalies
5. Trusted Advisor Review

Trusted Advisor was reviewed under the Cost Optimization category.

Observation

The AWS account uses the Basic Support Plan, which provides limited Trusted Advisor functionality.

Advanced cost optimization recommendations require Developer, Business, or Enterprise Support plans.

Result

Trusted Advisor was successfully accessed and reviewed. Due to support plan limitations, detailed cost optimization recommendations were unavailable.

6. Before vs After Cost Comparison
Without Optimization	With Optimization
On-Demand EC2 only	Spot Instances
Manual Scaling	Automatic Scaling
Fixed Infrastructure Cost	Pay for Required Capacity Only
Higher Compute Cost	Lower Compute Cost
Manual Resource Monitoring	Automatic Scaling & Monitoring
No Cost Alerts	Cost Anomaly Detection Enabled
7. Cost Savings Achieved

The implemented architecture reduces operational costs through:

Spot Instance pricing
Automatic scaling based on workload
Elimination of idle EC2 instances
Automated cost monitoring
Immediate anomaly notifications

Potential EC2 compute savings can reach up to 90% depending on Spot Instance availability and workload characteristics.

8. AWS Services Used
Amazon EC2
Launch Templates
Auto Scaling Groups
Spot Instances
Amazon CloudWatch
CloudWatch Alarms
AWS Cost Anomaly Detection
Amazon SNS
AWS Trusted Advisor
9. Conclusion

The cost optimization phase successfully demonstrated how AWS-native services can reduce infrastructure costs while maintaining application availability. Spot Instances were integrated with Auto Scaling to dynamically adjust compute capacity based on demand. CPU stress testing confirmed automatic scaling behavior, while AWS Cost Anomaly Detection and Trusted Advisor were used to monitor and evaluate cloud spending. Overall, the implemented solution provides a scalable, resilient, and cost-efficient deployment architecture suitable for enterprise cloud environments.