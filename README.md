# Vericold Log Parser

## Purpose
This module converts Vericold Technologies `.vcl` log files to a readable format for analysis in python.

## How it works
The main analysis is contained in the Jupyter Notebook. However, to load the vericold log files, we must first make sure that the .vcl files do not contain spaces in the filename. If they do, simply fire up a terminal and run

```sh rename.sh```

in the directory that contains the log files. This will remove all spaces and replace them with underscores. Next, you need to convert the proprietary `.vcl` file format to readable ascii, which can be done with the following command:

```sh log2ascii.sh```

in the same folder that contains the .vcl files. This bash script will loop over the available vcl files and convert them to comma separated values format. Next open the jupyter notebook and run through the analysis as you see fit.
