> ⚠️ **Module Deprecated – Repository Moved**

This Terraform module is no longer maintained under the **CloudDrove** organization:

**Old repository:** https://github.com/clouddrove/terraform-azure-subnet

The module has been permanently migrated to the **terraform-az-modules** organization:

**➡️ New home:** https://github.com/terraform-az-modules/terraform-azurerm-subnet

---

## What This Means

- ✅ Existing deployments will continue to work without interruption.
- 🛠 No fix backported to this old repo (if needed).
- 🚫 No new features or enhancements will be added here.
- 📦 All **new deployments and upgrades MUST use the module from `terraform-az-modules`**.

---

## How to Migrate

Simply update the `source` reference in your Terraform configuration.

### If you are using a Git source:

**Before (CloudDrove org):**
```hcl
module "example" {
   source      = "clouddrove/subnet/azure"
}
```

**After (Terraform-az-modules org):**
```hcl
module "example" {
   source      = "terraform-az-modules/subnet/azurerm"
}
```
## 📌 Issues, Discussions & Pull Requests

Going forward:

- 🚀 **All issues, feature requests, and pull requests must be created in the new repository:**
  **https://github.com/terraform-az-modules/terraform-azurerm-subnet**

- 📚 This old **CloudDrove** repository is now **read-only**, retained only for historical reference.
