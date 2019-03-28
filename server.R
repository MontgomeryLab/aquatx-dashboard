#
# This is a user-friendly interface to AQuATx, under development
#
library(shiny)
library(rhandsontable)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #### ---- Workflow Configuration ---- ####
  
  # Select workflow steps 
  # Add system calls to run configuration
  # Add system calls to run aquatx
  # Add DESeq data analysis code
  # Add plot code
  # Connect to UI
  
  #### ---- File Configuration ---- ####
  
  # Select local input files to process (should it be a directory?)
  volumes <- c(Home = fs::path_home(), "R Installation" = R.home(), getVolumes()())
  shinyFileChoose(input, 'in_files', root=volumes, filetypes=c('', 'fastq', 'fq', 'fa', 
                                                            'fasta', 'bam', 'sam', 'txt'))
  
  # Generate editable data table with filename/path, sample name, replicate number
  # Get the list of files
  sample_list <- reactive({
    req(input$in_files)
    parseFilePaths(volumes, input$in_files)$datapath
  })
  
  # Create the empty data frame
  sample_empty_df <- reactive({
    req(input$in_files)
    data.frame(file_paths = sample_list(),
    sample_names = "enter sample name here; no spaces",
    replicate_number = as.integer(1),
    stringsAsFactors = FALSE)
  })
  
  # Render the table
  output$sample_table <- renderRHandsontable({
    rhandsontable(sample_empty_df())
  })
  
  # Toggle on/off reference genome indexing: 
      
      # Select local reference genome file to process 
      shinyFileChoose(input, 'gen_file', root=volumes, filetypes=c('', 'fasta', 'fa'))
  
      # If the genome does not need to be indexed, have them select the files
      # Select local bt index files to process
      shinyFileChoose(input, 'ebwt_files', root=volumes, filetypes=c('', 'ebwt'))
  
  # Select local reference annotation files to process (should it be a directory?)
  shinyFileChoose(input, 'ref_files', root=volumes, filetypes=c('', 'gff3', 'gff'))
  
  # Generate editable data table with filename/path, mask, antisense toggle, class
  
  
  #### ---- Download the workflow files ---- ####
  
  # Once the button is clicked, create the updated configuration (via aquatx-config)
  
  #### ---- Run the workflow ---- ####
  
  # Once the button is clicked, create the updated configuration (via aquatx-config)
  # Then run the workflow
  
})
