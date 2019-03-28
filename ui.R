#
# This is a user-friendly interface to AQuATx, under development
#

library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(shinyFiles)
library(shinyWidgets)

wf_step_choices <- c('trim and filter', 'collapse duplicates', 'align to genome',
                    'count features', 'differential expression', 'plotting')

dashboardPage(
  # AQuATx App for configuration & interactive analysis
  dashboardHeader(title = "AQuATx Dashboard"),
  
  # Workflow Steps
  dashboardSidebar(
    sidebarMenu(
      menuItem("Welcome", tabName = "dashboard", icon = icon("swimmer")),
      menuItem("Configuration", tabName = "configuration", icon = icon("cogs"),
               menuSubItem("Workflow Parameters", tabName = "wf_config", icon=icon("sitemap")),
               menuSubItem("File Information", tabName="file_config", icon=icon("file-import")),
               menuSubItem("Running aquatx", tabName = "run_aquatx", icon=icon("desktop"))),
      menuItem("Data Preprocessing", tabName = "preprocessing", icon = icon("check")),
      menuItem("Differential Expression", tabName = "degs", icon = icon("dna")),
      menuItem("Additional Visualizations", tabName = "visualizations", icon = icon("chart-bar")),
      menuItem("Report Issues", tabName = "github", icon = icon("github"))
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
      
      # Configuring the workflow tab
      tabItem(tabName = "wf_config",
              h2("Configure Workflow Parameters"),
              
              fluidRow(column = 8, align='center',
              # Configure the steps to implement in the workflow
                        sliderTextInput('wf_steps', 
                                        label = 'Select the AQuATx workflow steps to run', 
                                        choices = wf_step_choices, 
                                        selected = wf_step_choices[c(1,6)],
                                        animate = FALSE, grid = TRUE, width = 500,
                                        dragRange = TRUE)
              ),
              fluidRow(column = 8, align='center',
                       "Create a bowtie index?",
                       prettySwitch('bt_index', label="", status="success",
                                    fill=TRUE), 
                       "Select a reference genome fasta to index: ", 
                       shinyFilesButton('gen_fasta', label='Select File', title='Please select a file', multiple=TRUE)
              )
      ),
      
      # Configuring the files
      tabItem(tabName = "file_config",
              h2("Configure File Information"),
              br(),
              h4("Select starting data input files for analysis"),
              shinyFilesButton('in_files', label='Select Files', title='Please select a file', multiple=TRUE),
              br(),
              rHandsontableOutput('sample_table'),
              br(),
              h4("Select reference GFF3 files for analysis"),
              shinyFilesButton('ref_files', label='Select Files', title='Please select a file', multiple=TRUE),
              br(),
              rHandsontableOutput('reference_table')
      ),
      
      # Running aquatx tab
      tabItem(tabName = "run_aquatx",
              h2("Running the workflow"),
              "To run the workflow you can either download the necessary files to run the commands yourself or
              run directly from within this app. If you close the app during a run, the run will be interrupted."
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
      ),
      
      # GitHub tab
      tabItem(tabName = "github",
              h2("GitHub & Contact"),
              "The source code for AQuATx and the dashboard are available on GitHub. Please report issues or feature
                requests for the code in the respective repositories."
      )
      
    )
  )
)
