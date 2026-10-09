# Contributing

For each new module:
1. Keep the module focused on one capability.
2. Include `main.tf`, `variables.tf`, `outputs.tf`, and a module README.
3. Use typed variables, descriptions, and validation where useful.
4. Avoid hard-coded names, regions, IDs, or secrets.
5. Prefer managed identities and least-privilege access.
6. Include an example that calls the module.
7. Document prerequisites, approximate cost drivers, and destroy/cleanup instructions.
8. Run `terraform fmt -recursive` and `terraform validate`.

Do not commit real credentials, customer identifiers, production state, or confidential configuration.
