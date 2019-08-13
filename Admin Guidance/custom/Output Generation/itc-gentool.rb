# iTC GenTool
# version 1.0
# August 13, 2019
# Brian Wood, be.wood@samsung.com
# MIT License

# Check for proper number of arguments and provide basic help if incorrect.

if ARGV.length != 2
  puts ""
  puts "The command line for itc-gentool is: itc-gentool <output type> <source file>"
  puts " The commands must be entered in this order"
  puts ""
  puts "The source file must be placed into the input folder."
  puts "The output file(s) will be placed into the output folder."
  puts ""
  puts "Output type can be one of the following:"
  puts " html - produces an HTML file from the source file"
  puts " pdf  - produces a PDF file from the source file"
  puts " both - produces both HTML and PDF files from the source file"
  puts ""
  puts " If both is specified, if either output file already exists then the script will abort"
  exit;
end

output = ARGV[0].downcase
exists = 0
filename = ARGV[1]
# Input file is supposed to be in the ./input folder, so adding that to the path
iname = './input/' + filename

if !(File.exist?(iname))
  puts ""
  puts "The source file does not exist. Please check the file and name."

else

# Determining if the output type is specified properly and providing help if it is incorrect.

  if output != "html" && output != "pdf" && output != "both"
    puts ""
    puts "The output type is not properly specified."
    puts "Output type can be one of the following:"
    puts " html - produces an HTML file from the source file"
    puts " pdf  - produces a PDF file from the source file"
    puts " both - produces both HTML and PDF files from the source file"
  
  else
  
  # Generating the filenames for each output type (easier to do it all here because of the both scenario 
  # than to do it individually). The "exists" variable is used to exit out if either of the output files
  # already exists so one isn't created and one not (to keep output in sync)
  
    fname = File.basename(filename, ".*" )
    # output is placed into the ./output folder, so adding that and the proper extension to the name to check
    honame = File.dirname(filename) + '/output/' + fname + '.html'
    poname = File.dirname(filename) + '/output/' + fname + '.pdf'
  
    if output == "html" || output == "both"
      puts "Checking if #{honame} exists"
      
      if (File.exist?(honame))
        puts ""
        puts "An HTML output file already exists, please delete or rename it to proceed."
        # this will allow to skip the PDF check if the HTML already exists
        exists = exists + 1
      end
    end
    
    if (output == "pdf" || output == "both") && exists == 0
      puts "Checking if #{poname} exists"
      
      if (File.exist?(poname))
        pits""
        puts "A PDF output file already exists, please delete or rename it to proceed."
        exists = exists + 1
      end
    end
    
    # All processing checks also enforce no pre-existing files
    if (output == "html" || output == "both") && exists == 0
      puts ""
      puts "Processing '#{filename}' ..."
      puts "Loading Asciidoctor Diagrams ..."
      puts "Loading Custom Notice blocks ..."
      puts "Preparing HTML Output ..."
    
      system("asciidoctor -r notice-block.rb -r asciidoctor-diagram -a data-uri -a toc=left -D output '#{iname}'")
    end
    
    if (output == "pdf" || output == "both") && exists == 0
      puts ""
      puts "Processing '#{filename}' ..."
      puts "Loading Asciidoctor Diagrams ..."
      puts "Loading Custom Notice blocks ..."
      puts "Preparing PDF Output ..."
    
      system("asciidoctor-pdf -r notice-block.rb -r asciidoctor-diagram -a pdf-theme=./themes/admonition-theme.yml -D output '#{iname}'")
    end
  
  end

end