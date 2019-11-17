# Terraform  - Create a KMS crypto key
This project is an implementation of [Terraform KMS Crypto Key](https://www.terraform.io/docs/providers/google/d/google_kms_crypto_key.html)
Layout. It creates a KMS Crypto Key and the respective Keyring. Support also a list of service accounts to grant them permissions.

## Example
```yaml
terraform {
  backend "gcs" {
    bucket  = "my-foo-bucket-tfstate"
    prefix  = "kms"
  }

  required_version = ">= 0.12"
}

provider "google-beta" {
  project = "my-foo-project"
  region  = "europe-west3"
  zone = "europe-west3-c"
}

module "my_cool_kms_key" {
  source = "./modules/terraform-google-kms"
  name = "my-cool-kms-key"
  location = "europe-west3"
  project = "my-foo-project"
  service_account = ["my-cool-account@my-cool-project.iam.gserviceaccount.com"]
}

```

## Variables
<table>
<tr>
<td> Variable name </td><td> Type </td><td> Description </td><td> Default value </td></tr>
<tr> <td> project </td><td> string </td><td> The ID of the project the resource belongs </td><td> </td></tr>
<tr> <td> location </td><td> string </td><td> Location of the cluster </td><td> </td></tr>
<tr> <td> name </td><td> string </td><td> The ID of the key and keyring </td><td> </td></tr>
<tr> <td> service_account </td><td> list(string) </td><td> A list of service accounts to grant permissions to that key </td><td> </td></tr> 
</table>


## Building
### Initialization

```
$ terraform init
```

### Planning

Terraform allows you to "Plan", which allows you to see what it would change
without actually making any changes.

```
$ terraform plan 
```

### Applying

```
$ terraform apply
```

### Modifying

If you want to update service accounts, then edit the `terraform.tfvars` file and run again `terraform apply`
```
$ terraform apply
```

### Destroying
```
$ terraform destroy
```

# Author

Georgios Kasapoglou

https://github.com/GeKasap

# License

Copyright 2019 Georgios Kasapoglou

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
