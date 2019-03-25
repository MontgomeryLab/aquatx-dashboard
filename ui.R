#
# This is a user-friendly interface to AQuATx, under development
#

library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(shinyFiles)

dashboardPage(
  # AQuATx App for configuration & interactive analysis
  dashboardHeader(title = "AQuATx Dashboard"),
  
  # Workflow Steps
  dashboardSidebar(
    sidebarMenu(
      menuItem("Welcome", tabName = "dashboard", icon = icon("swimmer")),
      menuItem("File Configuration", tabName = "configuration", icon = icon("file-import")),
      menuItem("Workflow Configuration", tabName = "workflow", icon = icon("sitemap")),
      menuItem("Data Preprocessing", tabName = "preprocessing", icon = icon("check")),
      menuItem("Differential Expression", tabName = "degs", icon = icon("dna")),
      menuItem("Additional Visualizations", tabName = "visualizations", icon = icon("chart-bar"))
    )
  ),
  
  #
  dashboardBody(
    tabItems(
      # Dashboard tab
      tabItem(tabName = "dashboard",
              h2("Welcome to the AQuATx Dashboard"),
              "This web application was developed to be used with AQuATx for small RNA sequencing data analysis.
              You must already have the tool installed to use this app. For more information see: https://github.com/biokcb/aquatx-srna",
              br(),br(),
              "This tool provides an easy-to-use interface for configuring or running the workflow. Additionally,
              it provides interactive visualization tools to produce customized plots for download.", br(),br(),
              
              h4("Steps:"),

              "1. Configure the workflow files and parameters.", br(),

              "2. Assess quality of input fastq files before/after running the workflow", br(),

              "3. View and search the differentially expressed gene table output of DESeq2.", br(),

              "4. Create visualizations to explore the data. Download as vector-editable PDF files."
      ),
      
      # Configuring the files
      tabItem(tabName = "configuration",
              h2("Select and label files"),
              "To be implemented..."
      ),
      
      # Configuring the workflow tab
      tabItem(tabName = "workflow",
              h2("Configure the workflow"),
              "To be implemented..."
      ),
      
      # Perform data preprocessing
      tabItem(tabName = "preprocessing",
              h2("Data Pre-processing Steps"),
              "To be implemented..."
      ),
      
      # Differential Gene Expression tab
      tabItem(tabName = "degs",
              h2("Analyze differentially expressed genes"),
              "To be implemented..."
      ),
      
      # Visualizations tab
      tabItem(tabName = "visualizations",
              h2("Data visualizations"),
              "To be implemented..."
      )
    )
  )
)
