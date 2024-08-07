# Apache Airavata Neuroscience Gateway


## Motivation
Currently tools such as BMTK exist to run simulations on constructed network files. One limitation of these tools, however, is the fact that it is difficult for neuroscientists to actually run intensive simulations with thousands of neurons on their local machine. Thus the purpose of the BMTK gateway is to allow computational neuroscientists to run bionet/pointnet (or any other simulator type) simulations in a streamlined workflow, making it easier and more viable to use the SONATA data format to reproduce and share experiments.


## Features
(to be expanded upon)
- **Running Simulations**: Simply upload a zip file to the BMTK tool portal. This zip file should contain a network folder, components folder, (if needed) inputs folder, as well as a file to compile the configuration file as well as the file that runs the simulation. An example of this file is provided in this repository with the name **compile_mechanisms.py**

## More information and future steps
- Please look at the Allen Insitute's bmtk workshop GitHub repository for a comprehensive guide on how to utilize bmtk as well as how to generate the aforementioned folders.
- The BMTK tool is currently a web application, but we hope to add this to airavata_magics.
- We are also adding a tool to generate network folders in the near future.
