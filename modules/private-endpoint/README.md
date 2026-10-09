# Private Endpoint module
Creates a private endpoint for a target Azure resource. The caller must supply the target resource's correct subresource name (for example, `blob` for a Storage Account) and handle private DNS zone integration separately. Private endpoints alone do not guarantee private name resolution or complete network isolation.
