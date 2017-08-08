#SingleInstance Force
FileInstall, C:\logo.png,logo.png,1
FileInstall, C:\curl-ca-bundle.crt,curl-ca-bundle.crt,1
FileInstall, C:\curl.exe,curl.exe,1
FileInstall, C:\libcurl.dll,libcurl.dll,1
Gui,Add,Text,x194 y9 w140 h65,This tool is powered by cURL. This downloads .mp4 file from Imgur (.gifv), which browsers fail to do.
Gui,Add,Text,x21 y16 w170 h13,Paste the filename (with .gifv) here
Gui,Add,Button,x122 y32 w60 h23 gDownload, Download
Gui,Add,Edit,x20 y33 w100 h21 vURL,
Gui,Add,Text,x11 y81 w220 h51,To get filename, right click on the video and press Save Video As. Then, don't press Save (it returns garbage anyway) and copy the name.
Gui,Add,Picture,x230 y60 w100 h100,logo.png
Gui,Add,Text,x11 y141 w140 h13,(C) 2017 Torbjorn
Gui,Show,w337 h163,Imgur GIFV Downloader
return
Download:
guiControlGet, inname,,URL
StringTrimRight,outname,inname,5
; MsgBox,result = "%outname%"
FileDelete, temp.cmd
Sleep, 50
FileAppend, curl.exe https://i.imgur.com/%outname%.mp4 `>%outname%.mp4, temp.cmd
Run, temp.cmd
Return

GuiClose: 
GuiEscape:
ExitApp
