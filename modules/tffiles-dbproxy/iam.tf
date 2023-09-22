data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    sid = "AllowRdsToGetSecretValueFromSecretsManager"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [ 
      "${var.result_secrets_arn}" 
    ]
  }

  statement {
    sid = "AllowRdsToUseKmsKeyToDecryptSecretValuesInSecretsManager"

    actions = [
      "kms:Decrypt"
    ]

    resources = [
      "${var.result_kms_key}"
    ]

    condition {
      test     = "StringEquals"
      values   = ["secretsmanager.${var.region}.amazonaws.com"]
      variable = "kms:ViaService"
    }
  }
}

resource "aws_iam_policy" "this" {
  name   = "${var.name}-policy-${var.environment}-rds-proxy-${random_id.this.hex}"
  policy = join("", data.aws_iam_policy_document.this.*.json)
}

resource "aws_iam_role" "this" {
  name               = "${var.name}-role-${var.environment}-rds-proxy-${random_id.this.hex}"
  path               = "/"
  assume_role_policy = join("", data.aws_iam_policy_document.assume_role.*.json)
}

resource "aws_iam_role_policy_attachment" "this" {
    role       = "${aws_iam_role.this.id}"
    policy_arn = join("", aws_iam_policy.this.*.arn)
}
