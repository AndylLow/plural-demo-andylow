metadata {
  path = "kubecost"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:5+lDA5TI0Voc/7LT1XyYilsByBnYUxic/DOTQ/IdV0A="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:5+lDA5TI0Voc/7LT1XyYilsByBnYUxic/DOTQ/IdV0A="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "kubecost"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubecost",
  ]

  sha     = "h1:5+lDA5TI0Voc/7LT1XyYilsByBnYUxic/DOTQ/IdV0A="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "55a57af28f644be46f5ecd9f879db40fc92819f3fc61384b4629696b33027291"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kubecost"
  target  = "kubecost/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubecost",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kubecost"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubecost",
  ]

  sha     = "h1:beMwSrU+34Uckym1GpvmowbvW7K2OqVYwrklY7G5fcg="
  retries = 2
  verbose = false
}
