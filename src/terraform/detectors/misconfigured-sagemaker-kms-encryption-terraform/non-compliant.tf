#  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
#  SPDX-License-Identifier: Apache-2.0

# {fact rule=misconfigured-sagemaker-kms-encryption-terraform@v1.0 defects=1}
resource "aws_sagemaker_endpoint_configuration" "foo" {
  name = "terraform-sagemaker-example"
  # Noncompliant: all data stored in the Sagemaker Endpoint is not encrypted at rest.
  production_variants {
    variant_name           = "variant-1"
    model_name             = aws_sagemaker_model.foo.name
    initial_instance_count = 1
    instance_type          = "ml.t2.medium"
    initial_variant_weight = 1
  }

  tags = {
    foo = "bar"
  }
}
# {/fact}