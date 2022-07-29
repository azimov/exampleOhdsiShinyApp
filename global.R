###
# Diagnostics explorer initiation into isolated environment
###
diagnosticsExplorer <- new.env()
shinyConfigPath <- "cd-app-config.yml"
diagnosticsExplorerModulePath <- system.file("shiny", "DiagnosticsExplorer", package = "CohortDiagnostics")
moduleRPath <- file.path(diagnosticsExplorerModulePath, "R")

# Source all app files in to isolated namespace
lapply(file.path(moduleRPath, 
                 list.files(moduleRPath, pattern = "*.R")), source, local = diagnosticsExplorer)

# Load shiny settings, Initialize diagnostics explorer environment
diagnosticsExplorer$shinySettings <- diagnosticsExplorer$loadShinySettings(shinyConfigPath)
diagnosticsExplorer$initializeEnvironment(diagnosticsExplorer$shinySettings,
                                          table1SpecPath = file.path(diagnosticsExplorerModulePath, "data", "Table1SpecsLong.csv"),
                                          dataModelSpecificationsPath = file.path(diagnosticsExplorerModulePath, "data", "resultsDataModelSpecification.csv"),
                                          envir = diagnosticsExplorer)