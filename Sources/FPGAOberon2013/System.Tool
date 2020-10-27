System.Open ^  System.Recall  System.Watch  System.Collect
Edit.Open ^  Edit.Recall
Edit.ChangeFont Oberon10i.Scn.Fnt
Edit.ChangeFont Oberon10b.Scn.Fnt

System.Directory ^
  *.Mod  *.Bak  *.Tool  *.Text  *.Scn.Fnt  *.smb  *.rsc

ORP.Compile @  ORP.Compile @/s  ORP.Compile name~
System.Free ~
System.Open Draw.Tool
System.CopyFiles ~
System.RenameFiles ~
System.DeleteFiles ~

System.ShowModules  System.ShowCommands ^ 

PCLink1.Run
Hilbert.Draw  Sierpinski.Draw  Blink.Run  Stars.Open

Tools.Inspect 0
Tools.Sector 1
Tools.ShowFile 
Tools.Recall  Tools.Clear

# ----- building the system (outer core upwards) with a single mouse click ----

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

  ORP.Compile Curves.Mod/s Sierpinski.Mod/s ~
  ORP.Compile Hilbert.Mod/s Stars.Mod/s ~
  ORP.Compile Rectangles.Mod/s Checkers.Mod/s ~
  ORP.Compile Math.Mod/s Blink.Mod/s ~

~
