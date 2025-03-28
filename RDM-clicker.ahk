#Requires AutoHotkey v2.0
#SingleInstance Force

A_TrayMenu.Delete() ; Deletes standard tray elements
A_TrayMenu.Add("Show Gui", ShowGui)
A_TrayMenu.Add("Exit App", KillApp)
A_IconTip := "RDM Clicker - by JM"

; Create the GUI
myGui := Gui()
myGui.OnEvent("Close", HideGui)
myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
myGui.SetFont("s11", "Calibri")
Tab := myGui.Add("Tab3", "x0 y0 w512 h290", ["Left Click", "Right Click"])

Tab.UseTab(1)
myGui.Add("GroupBox", "x10 y40 w480 h80", "Options")
myGui.Add("GroupBox", "x10 y130 w480 h140", "Clicks")
LeftMin := myGui.Add("Slider", "x30 y171 w440 h22 +Tooltip Range1-21 TickInterval1", "11") ;Tab1 Slider1
LeftMax := myGui.Add("Slider", "x30 y213 w440 h22 +Tooltip Range1-21 TickInterval1", "11") ;Tab1 Slider 2
myGui.Add("Text", "x190 y145 w120 h23 +0x200 +Center", "Min.")
myGui.Add("Text", "x190 y238 w120 h23 +0x200 +Center", "Max.")
LeftUpDown := myGui.Add("Edit", "x440 y72 w35 h21 +Number Limit3 -WantReturn", "30") ;Tab1 Up-Down delay field
myGui.Add("Text", "x338 y71 w98 h23 +0x200", "Up-Down Delay")
LeftEnabled := myGui.Add("CheckBox", "x42 y71 w72 h23 Checked", " Enabled") ;LeftClick Enabled checkbox
myGui.Add("Text", "x180 y72 w98 h23 +0x200", "Mouse button 5")

Tab.UseTab(2)
myGui.Add("GroupBox", "x10 y40 w480 h80", "Options")
myGui.Add("GroupBox", "x10 y130 w480 h140", "Clicks")
RightMin := myGui.Add("Slider", "x30 y171 w440 h22 +Tooltip Range1-21 TickInterval1", "11") ;Tab2 Slider1
RightMax := myGui.Add("Slider", "x30 y213 w440 h22 +Tooltip Range1-21 TickInterval1", "11") ;Tab2 Slider2
myGui.Add("Text", "x190 y145 w120 h23 +0x200 +Center", "Min.")
myGui.Add("Text", "x190 y238 w120 h23 +0x200 +Center", "Max.")
RightUpDown := myGui.Add("Edit", "x440 y72 w35 h21 +Number Limit3 -WantReturn", "30") ;Tab2 Up-Down delay field
myGui.Add("Text", "x338 y71 w98 h23 +0x200", "Up-Down Delay")
RightEnabled := myGui.Add("CheckBox", "x42 y71 w72 h23 Checked", " Enabled") ;RightClick Enabled checkbox
myGui.Add("Text", "x180 y72 w98 h23 +0x200", "Mouse button 4")

myGui.Title := "RDM Clicker"
myGui.Show("w500 h280")

HideGui(*)
{
    myGui.Hide()
}

ShowGui(*)
{
	myGui.Show()
}

KillApp(*)
{
	ExitApp
}

*XButton2::
{
	If LeftEnabled.Value
	{
		LeftMinMs := 1000/LeftMin.Value
		LeftMaxMs := 1000/LeftMax.Value
		LLUD := LeftUpDown.Value
		LCheck := LeftMaxMs >= LLUD
		while GetKeyState("XButton2", "P")
		{
			Click "Left Down"
			Sleep LLUD
			CLick "Left Up"
			If LCheck
			{
				Sleep (Random(LeftMinMs,LeftMaxMs)-LLUD)
			}
		}
	}
}

*XButton1::
{
	If RightEnabled.Value
	{
		RightMinMs := 1000/RightMin.Value
		RightMaxMs := 1000/RightMax.Value
		RLUD := RightUpDown.Value
		RCheck := RightMaxMs >= RLUD
		while GetKeyState("XButton1", "P")
		{
			Click "Right Down"
			Sleep RLUD
			CLick "Right Up"
			If RCheck
			{
				Sleep (Random(RightMinMs,RightMaxMs)-RLUD)
			}
		}
	}
}
