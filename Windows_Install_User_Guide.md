The following document will describe the steps needed to set install and configure ascii doctor and the Visual Studio Editor with ascii doctor extension. 

# Step 1 - Chocolatey

Install Chocolatey via the installation proceedure [here](https://chocolatey.org/install).

For a quick install, open an elevated powershell and run the following command:

`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

# Step 2 - Ruby

Once chocolatey is installed, run the following command from the previously opened powershell promt:

`choco install ruby`

Enter "a" when prompted to allow the installation

# Step 3 - asciidoctor

Now that ruby is installed we need to navigate to the install directory, enter the following command in your shell:

`cd C:\tools\ruby27\bin`

and then

`./gem install asciidoctor`

# Step 4 - Visual Studio Code 

Now that asciidoctor is installed, we can move on to an editor. Visual Studio Code is free with no liscensing requirement and has an asciidoctor extension with a WISYWIG preview window.

Grab the VS Code installer [here](https://code.visualstudio.com/Download)

# Step 5 - asciidoc extension

Open the newly installed VS Code application and click on the extensions icon in the left-most vertical pane. See image below:

<img alt="extensions icon" src="https://i.imgur.com/3s62Ql9.png">

Search for "asciidoc" in the prompt and then install the AsciiDoc 2.7.15 extension from Joao Pinto

When you open a .adoc file, you should see a editor pane and a live preview pane. If you do not, simply click the show preview icon from the upper right hand corner of your editor window:

<img alt="preview icon" src="https://imgur.com/n4roHph.png">

# Step 6 - Consult the Style Guide

Now that you are up and running, you can load in the ITC Tools templates and get going. If you are having trouble with the markdown, please see the [style guide](https://github.com/itc-wgtools/cPP-Tools/blob/master/User%20Guidance/Syntax-Guide.adoc).
