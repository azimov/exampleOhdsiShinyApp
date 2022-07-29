# Ohdsi combined shiny app example

This application should work installing packages initiated in the renv and CohortDiagnostics

```
renv::restore()
# For some reason this won't snapshot
remotes::install_github("OHDSI/CohortDiagnostics", ref = "develop")
```

The configuration for PLP just requires a keyring variable with settings for the correct database.

CohortDiagnostics is slightly more involved, requiring modification to the config file `cd-app-config.yml`.
