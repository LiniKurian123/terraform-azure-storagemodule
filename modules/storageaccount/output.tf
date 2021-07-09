output "storageid" {
    value = azurerm_storage_account.lk-sa.id
    description = "This gives the ID of the stroage account provisoned by terraform"
}