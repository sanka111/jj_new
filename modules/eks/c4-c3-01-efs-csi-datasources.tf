# Datasource: AWS Caller Identity
data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

# Datasource: EFS CSI IAM Policy get from EFS GIT Repo (latest)
data "http" "efs_csi_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-efs-csi-driver/master/docs/iam-policy-example.json"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

output "efs_csi_iam_policy" {
  #value = data.http.ebs_csi_iam_policy.body
  value = data.http.efs_csi_iam_policy.response_body
}

