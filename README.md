# Oberon-batch-execution-facility
Simple batch execution facility for the Project Oberon 2013 and Extended Oberon operating systems.

Note: In this repository, the term "Project Oberon 2013" refers to a re-implementation of the original "Project Oberon" on an FPGA development board around 2013, as published at www.projectoberon.com.

**PREREQUISITES**: A current version of Project Oberon 2013 (see http://www.projectoberon.com). If you use Extended Oberon (see http://github.com/andreaspirklbauer/Oberon-extended), the functionality is already implemented.

------------------------------------------------------
**1. Using the batch execution facility**

The command *System.Batch* file executes multiple commands separated by ~ in the specified batch file. The contents of the batch file are displayed in a system viewer. Execution stops when the first invalid command is encountered (this can be another ~). Comments are not allowed.

For example, if a batch file *RebuildCompiler.Batch* is created containing the commands

     ORP.Compile ORS.Mod/s ORB.Mod/s ~
     ORP.Compile ORG.Mod/s ORP.Mod/s ~
     System.Free ORP ORG ORB ORS ~
     ~

then the command *System.Batch RebuildCompiler.Batch* ~ will rebuild the Oberon compiler and unload the old one.

The command *Oberon.Batch* is almost identical to *System.Batch*, except that it executes the commands *immediately following* it in the text, where the command itself is located *and* that it invokes the garbage collector after each executed command, if necessary [1].

The output of the command *Oberon.Batch* is displayed in the system-wide log. For example, the following command in the tool file *System.Tool* allows the user to build the entire Oberon system (outer core upwards) with a single mouse click:

     Oberon.Batch
       ORP.Compile Input.Mod/s Display.Mod/s Viewers.Mod/s ~
       ORP.Compile Fonts.Mod/s Texts.Mod/s ~
       ORP.Compile Oberon.Mod/s ~
       ORP.Compile MenuViewers.Mod/s ~
       ORP.Compile TextFrames.Mod/s ~
       ORP.Compile System.Mod/s Edit.Mod/s ~
       ORP.Compile Tools.Mod/s ~

       ORP.Compile ORS.Mod/s ORB.Mod/s ~
       ORP.Compile ORG.Mod/s ORP.Mod/s ~
       ORP.Compile ORTool.Mod/s ~

       ORP.Compile PCLink1.Mod/s ~

       ORP.Compile Graphics.Mod/s GraphicFrames.Mod/s ~
       ORP.Compile GraphTool.Mod/s MacroTool.Mod/s Draw.Mod/s ~
     ~

Finally, the system executes the batch file *System.Batch* when the system starts, e.g.,

      PCLink1.Run ~
      System.Watch ~
      ~

[1] The reason why *System.Batch* does not invoke the garbage collector is that it allocates a text and a viewer (referred to by local variables) which would be collected if the garbage collector were invoked. To prevent this from happening, we could have chosen to make these variables global, but we opted to restrict automatic garbage collection to the command *Oberon.Batch* (where the stack is known to not contain any pointers into the heap).

------------------------------------------------------
**2. Preparing your system to use the batch execution facility**

Download all files from the [**Sources**](Sources/) directory of this repository. Convert the *source* files to Oberon format (Oberon uses CR as line endings) using the command [**dos2oberon**](dos2oberon), also available in this repository (example shown for Linux or MacOS):

     for x in *.Mod *.Tool; do ./dos2oberon $x $x ; done

Import the files to your Oberon system. If you use an emulator (e.g., **https://github.com/pdewacht/oberon-risc-emu**) to run the Oberon system, click on the *PCLink1.Run* link in the *System.Tool* viewer, copy the files to the emulator directory, and execute the following command on the command shell of your host system:

     cd oberon-risc-emu
     for x in *.Mod *.Tool ; do ./pcreceive.sh $x ; sleep 1 ; done

Compile the following modules:

     ORP.Compile Oberon.Mod/s ~
     ORP.Compile MenuViewers.Mod/s ~
     ORP.Compile TextFrames.Mod/s ~
     ORP.Compile System.Mod/s Edit.Mod/s ~

     ORP.Compile ORS.Mod/s ORB.Mod/s ~
     ORP.Compile ORG.Mod/s ORP.Mod/s ~
     ORP.Compile ORTool.Mod/s ~

Restart the Oberon system.



