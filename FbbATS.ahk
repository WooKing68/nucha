#SingleInstance off
#WinActivateForce



#Include, %A_ScriptDir%\Gdip.ahk
pToken := Gdip_Startup()



global CHART_NUM := 1
global BUY_SELL_COLOR_NUM := 1



global FBB_Title := ""
global GuiX := 15
global GuiY := 30
global GuiW := 20
global GuiH := 50
global GuiX1 := 90
global itemX := 15
global itemY := 140
global itembtnW := 70
global itembtnH := 25
global CoordW := 50
global CoordH := 15

CoordMode, Relative  ; ��ǥ��带 Relative Ȱ��â ��������
Gui, +AlwaysOnTop -SysMenu -Caption
Gui, font, s8 Bold c6E6E6E,
Gui, Add, Text, x1 y1 w330 h25 guiMove vGuiMove,
Gui, Add, Text, x15 y10 w300 h25, FINAL BIG BOSS - Auto Trading System
Gui, Add, Text, cRed x330 y7 w10 h10 gGuiMin vGuiMin, ��
Gui, Add, Text, cRed x350 y5 w10 h10 gGuiClose vGuiClo, x
Gui, Color, F2F2F2
Gui, font, s9 cBlack w500,
Gui, Add, GroupBox, x16 yp+18 w175 h100 cWhite
Gui, Add, Text, xp+10 yp+18 w90 h20 vText�Ÿ�����, �Ÿ�����:
Gui, Add, Text, xp yp+27 w90 h20, �ֹ���ü:
Gui, Add, Text, xp yp+27 w90 h20, �ŸŹ���:
Gui, font, s9 w800
Gui, Add, Text, x%GuiX1% yp-55 w%GuiX1% h20 cBlue vItemView Center, ��������
Gui, font, s9 w400
Gui, Add, Edit, xp yp+24 w%GuiX1% h20 cBlack Center, HTS 01
Gui, Add, DropDownList, xp yp+26 w%GuiX1% h20 r40 -background choose1 +altsubmit, ����ȣ|�ż���ȣ|�ŵ���ȣ
Gui, Add, GroupBox, xp+110 yp-68 w80 h100
Gui, Add, Button, x290 y28 w70 h50 gRun vStartBtn, ����
Gui, font, s8 w400 cRed
Gui, Add, Text, xp+7 yp+57 w70 h15 vInfo,
Gui, font, s8 w600 cA4A4A4
Gui, Add, Text, xp-7 yp+25 w70 h20 cD8D8D8 vModeBtn gWinMaxMin, �� �̴ϸ��
Gui, font, s9 w400
Gui, Add, Button, x%itemX% y%itemY% w%itembtnW% h%itembtnH% vBTN1 gItemBtn, ��������
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN2 gItemBtn, ũ������
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN3 gItemBtn, ������
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN4 gItemBtn, S&P500
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN5 gItemBtn, ����FX
Gui, Add, Button, x%itemX% yp+25 w%itembtnW% h%itembtnH% vBTN6 gItemBtn, ���
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN7 gItemBtn, �ǹ�
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN8 gItemBtn, �׼�
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN9 gItemBtn,
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN10 gItemBtn,
Gui, Add, GroupBox, x%itemX% yp+30 w277 h30
Gui, Add, Button, xp+276 yp+5 w%itembtnW% h%itembtnH% gSet vSetBtn, ����

Gui, Add, Tab2, x%GuiX% y250 w345 h135, �ŷ���Ȳ|�ŷ�����|��ȣ�α�
Gui, tab, �ŷ���Ȳ  ;Tab1
Gui, Add, ListView, xp+10 yp+30 w325 h95
Gui, tab, �ŷ�����  ;Tab2
Gui, Add, ListView, xp yp w325 h95
Gui, tab, ��ȣ�α�  ;Tab3
Gui, Add, ListView, xp yp w325 h95

;���� ��
Gui, Add, Tab2, x390 y28 w445 h356, ��ǥ����|���Թ��|û����|�ð�����|���Ͽ�...

;tab 1 --------------------
Gui, tab, ��ǥ����  ;Tab1
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, GroupBox, xp+15 yp+15 w235 h115, ��Ʈ���� �� ��ȣ���� ��ǥ����
Gui, Add, Checkbox, xp+15 yp+20 w50 h20, ��Ʈ1
Gui, Add, Checkbox, xp yp+22 w50 h20, ��Ʈ2
Gui, Add, Checkbox, xp yp+22 w50 h20, ��Ʈ3
Gui, Add, Checkbox, xp yp+22 w50 h20, ��Ʈ4
Gui, Add, Edit, xp+60 yp-64 w%CoordW% h%CoordH% vChart_1_1, aaa_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_2_1, bbb_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_3_1, ccc_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_4_1, ddd_1
Gui, Add, Edit, xp+50 yp-66 w%CoordW% h%CoordH% vChart_1_2, aaa_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_2_2, bbb_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_3_2, ccc_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_4_2, ddd_2
Gui, Add, Button, xp+55 yp-67 w40 h18 g��Ʈ1, ��ǥ
Gui, Add, Button, xp yp+22 w40 h18 g��Ʈ2, ��ǥ
Gui, Add, Button, xp yp+22 w40 h18 g��Ʈ3, ��ǥ
Gui, Add, Button, xp yp+22 w40 h18 g��Ʈ4, ��ǥ

Gui, Add, GroupBox, x660 y70 w155 h75, ��ȣ���� ����
Gui, Add, Button, xp+8 yp+20 w50 h20 g�ż�������, �ż�
Gui, Add, Button, xp yp+26 w50 h20 g�ŵ�������, �ŵ�
Gui, Add, Text, xp+55 yp-25 w30 h20 vBuySellColor_1 border BackgroundTrans,
Gui, Add, Text, xp yp+25 w30 h20 vBuySellColor_2 border BackgroundTrans,
Gui, Add, Edit, xp+35 yp-25 w50 h20 vBuySellColorValue_1, aaa
Gui, Add, Edit, xp yp+25 w50 h20 vBuySellColorValue_2, bbb

Gui, Add, GroupBox, x660 y140 w155 h45, ��ȣ���� ���
Gui, Add, Button, xp+40 yp+17 w70 h20 vSignalMethod gSMothod, ��Ʈ����

Gui, Add, GroupBox, x415 y190 w0 h0 vViewGBox, ��ȣ���� ��Ʈ ����(���ڴ� ��Ʈ ��ȣ)
Gui, Add, Text, xp+32 yp+25 w0 h0 vChk1, 1
Gui, Add, Text, xp+110 yp w0 h0 vChk2, 2
Gui, Add, Text, xp+110 yp w0 h0 vChk3, 3
Gui, Add, Text, xp+110 yp w0 h0 vChk4, 4

Gui, Add, Button, x487 yp-3 w0 h0 vPulsbtn1, +
Gui, Add, Button, xp+110 yp w0 h0 vPulsbtn2, +
Gui, Add, Button, xp+110 yp w0 h0 vPulsbtn3, +

Gui, Add, GroupBox, x415 y295 w200 h70, �ֹ���ư ��ǥ ����
Gui, Add, Text, xp+10 yp+22 w40 h15, �ż�:
Gui, Add, Edit, xp+35 yp-2 w%CoordW% h%CoordH% ,
Gui, Add, Edit, xp+50 yp w%CoordW% h%CoordH%,
Gui, Add, Text, xp-85 yp+22 w40 h15, �ŵ�:
Gui, Add, Edit, xp+35 yp-2 w%CoordW% h%CoordH%,
Gui, Add, Edit, xp+50 yp w%CoordW% h%CoordH%,
Gui, Add, Button, xp+54 yp-22 w40 h18, ��ǥ
Gui, Add, Button, xp yp+21 w40 h18, ��ǥ

Gui, Add, GroupBox, x630 y295 w125 h70, �ֹ���ü ����
Gui, Add, Button, xp+15 yp+21 w95 h30 vGetTP gGetTradingProgram, SETUP

;tab 2 --------------------
Gui, tab, ���Թ��  ;Tab2
Gui, Add, GroupBox, x400 y55 w425 h320

;tab 3 --------------------
Gui, tab, û����  ;Tab3
Gui, Add, GroupBox, x400 y55 w425 h320

;tab 4 --------------------
Gui, tab, �ð�����  ;Tab4
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, Checkbox, xp+20 yp+15 w140 h20, ���۽ð� ���� ���
Gui, Add, GroupBox, xp yp+25 w140 h65, ��������/�ɼ�
Gui, Add, Text, xp+10 yp+20 w60 h20, ���۽ð�:
Gui, Add, Text, xp yp+20 w60 h20, ����ð�:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 09:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 15:00:00
Gui, Add, GroupBox, xp-75 yp+35 w140 h65, �ؿܼ���
Gui, Add, Text, xp+10 yp+20 w60 h20, ���۽ð�:
Gui, Add, Text, xp yp+20 w60 h20, ����ð�:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 09:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 22:00:00 

Gui, Add, Checkbox, xp+110 yp-140 w140 h20, �����ð� ���� ���
Gui, Add, GroupBox, xp yp+25 w140 h65, �����ð�1
Gui, Add, Text, xp+10 yp+20 w60 h20, ���۽ð�:
Gui, Add, Text, xp yp+20 w60 h20, ����ð�:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 12:55:00
Gui, Add, Edit, xp yp+20 w50 h18, 14:00:00
Gui, Add, GroupBox, xp-75 yp+35 w140 h65, �����ð�2
Gui, Add, Text, xp+10 yp+20 w60 h20, ���۽ð�:
Gui, Add, Text, xp yp+20 w60 h20, ����ð�:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 16:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 18:00:00

;tab 5 --------------------
Gui, tab, ���Ͽ�...  ;Tab5
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, Text, xp+10 yp+15 w200 h20, ����: FINAL BIG BOSS Technology


Gui, Show, w375 h400 Center

coordmode, mouse, screen

Return



GuiClose:
	Gdip_Shutdown(pToken)
ExitApp

BuyColor:
	BUY_SELL_COLOR_NUM := 1
return 


SellColor:
	BUY_SELL_COLOR_NUM := 2
return



��Ʈ1:
	CHART_NUM := 1
return

��Ʈ2:
	CHART_NUM := 2
return

��Ʈ3:
	CHART_NUM := 3
return

��Ʈ4:
	CHART_NUM := 4
return


�ż�������:
	Gui, submit, nohide
	BUY_SELL_COLOR_NUM := 1
	MsgBox, 0x1000,, �ż�������: `n�ż���ȣ ȭ��ǥ�� ���콺 Ŀ���� ������ ���� "Esc" �� ��������!, 5
return

�ŵ�������:
	Gui, submit, nohide
	BUY_SELL_COLOR_NUM := 2
	MsgBox, 0x1000,, �ŵ�������: `n�ŵ���ȣ ȭ��ǥ�� ���콺 Ŀ���� ������ ���� "Esc" �� ��������!, 5
return


uiMove:    ; ���콺 �巡��
	PostMessage, 0xA1, 2,,, A 
Return

GuiMin:
	Gui, submit, nohide
	WinMinimize, %FBB_Title%
return

set:
Gui, submit, nohide
if (SetBtn == 1)
{
	Gui, Show, w375 h400, %FBB_Title%
    GuiControl, Text, SetBtn, ����
	GuiControl, Move, GuiMin, x330
	GuiControl, Move, GuiClo, x350
	GuiControl, Move, GuiMove, w330
	SetBtn := 0
}
else
{
	Gui, Show, w850 h400, %FBB_Title%
    GuiControl, Text, SetBtn, ��
	GuiControl, Move, GuiMin, x805
	GuiControl, Move, GuiClo, x825
	GuiControl, Move, GuiMove, w800
	SetBtn := 1
}
return

WinMaxMin:
Gui, submit, nohide
if (ModeBtn == 1)
{
	Gui, Show, w375 h400, %FBB_Title%
    GuiControl, Text, ModeBtn, �� �̴ϸ��
	ModeBtn := 0
}
else
{
	Gui, Show, w375 h135 %FBB_Title%
    GuiControl, Text, ModeBtn, �� �⺻���
	GuiControl, Text, SetBtn, ����
	GuiControl, Move, GuiMin, x330
	GuiControl, Move, GuiClo, x350
	GuiControl, Move, GuiMove, w330
	SetBtn := 0
	ModeBtn := 1
}
return


Run:
Gui, submit, nohide
if (startBtn == 1)
{    
    GuiControl, Text, startBtn, ����
	GuiControl, Text, Info,
	startBtn := 0
	SetTimer, S_Search, Off
}
else
{    
    GuiControl, Text, startBtn, ����	
	startBtn := 1	
	GuiControl, Text, Info, �۵� ��......
	SetTimer, S_Search, On, 1000	
}
return

S_Search:
ImageSearch, outX, outY, x1, y1, x2, y2, imagefile
return


TapExtend:
Gui, submit, nohide

if (TapExt1  == true)
{    
	Gui, Show, w375 h300, %FBB_Title%
}
else if (TapExt2 == true)
{ 
	Gui, Show, w375 h500 %FBB_Title%
}
else if (TabExt3 == true)
{ 
	Gui, Show, w375 h500 %FBB_Title%
}
return



SMothod:
Gui, submit, nohide
if (SignalMethod == 1)
{    
    GuiControl, Text, SignalMethod, ��Ʈ����
	GuiControl, Hide, ViewGBox
	GuiControl, Move, Chk1, w0 h0
	GuiControl, Move, Chk2, w0 h0
	GuiControl, Move, Chk3, w0 h0
	GuiControl, Move, Chk4, w0 h0
	GuiControl, Move, Pulsbtn1, w0 h0
	GuiControl, Move, Pulsbtn2, w0 h0
	GuiControl, Move, Pulsbtn3, w0 h0 
	SignalMethod := 0	
}
else
{ 
    GuiControl, Text, SignalMethod, ��Ʈ����
	GuiControl, Show, ViewGBox
	GuiControl, Move, ViewGBox, w400 h60	
	GuiControl, Move, Chk1, w45 h18
	GuiControl, Move, Chk2, w45 h18
	GuiControl, Move, Chk3, w45 h18
	GuiControl, Move, Chk4, w25 h18
	GuiControl, Move, Pulsbtn1, w40 h18
	GuiControl, Move, Pulsbtn2, w40 h18
	GuiControl, Move, Pulsbtn3, w40 h18 
	SignalMethod := 1
}
return


ItemBtn:
	Gui, submit, nohide
		
	GuiControlGet, CtrlName, Focus  ;��Ʈ���� �����̸��� ��´� BTN1  Focus : ��Ʈ���� �����̸� Button3�� ��´�.
	btnName := CtrlName
	ControlGetText, getText, %btnName%, A   ;GuiControlGet���� FocusV�� �ϸ� �ȵǰ� ������Ʈ���̸��� ��� Focus�� �ؾ���.
	GuiControl, Text, ItemView, %getText%   ;ControlGetText���� ���� ������ �ش� ��Ʈ���� Text�� �����Ѵ�.

	GuiControlGet, CtrlName, FocusV

	Loop, 10 {
		
		s := "BTN" . A_index
		if (CtrlName == s) {
			;MsgBox, % s
			Break
		}
	}
	
return


GetTradingProgram:
Gui, submit, nohide
MsgBox, 0x1000,, "����� HTS ���α׷��� Ÿ��Ʋ�ٸ� ����(���콺 �� ����Ŭ��) �ϼ���!", 5

gosub, getControl

return


;~ esc:
;~ WinGetClass, OutputVar, A
;~ MsgBox %OutputVar%
;~ return

getControl:
;KeyWait,
return


;~ ^!z::  ; Control+Alt+Z hotkey.
Esc::  ; Control+Alt+Z hotkey.
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%, RGB  ;;;RGB �ɼ��� ���� ������ BGR, �� û��, ���, ���� ������ ���´�.
	;MsgBox The color at the current cursor position is %color%.
	;GuiControl, +c%color%  +Redraw, Text�Ÿ�����
	
	;Gui, Color,, Navy ; Edit Background Color
	;Gui, Font, cWhite ; Font Color
	GuiControl, +c%color% +Redraw, BuySellColor_%BUY_SELL_COLOR_NUM%
	GuiControl, Text, BuySellColor_%BUY_SELL_COLOR_NUM%, s12 bold
	GuiControl,, BuySellColor_%BUY_SELL_COLOR_NUM%, ���

	

	

	GuiControl,, BuySellColorValue_%BUY_SELL_COLOR_NUM%, %color%

	;GuiControl +BackgroundFF9977, Text�Ÿ�����

	;GuiControl +BackgroundFF0000, BuyColor
return


;^+F6 [Ctrl + Shift + F6]
F6::
	Gui, NewWindowName%CHART_NUM%: Destroy 
return




^Lbutton::
	MouseGetPos, mx1, my1
	settimer, rectangle, 100
return

^Lbutton UP::
	settimer, rectangle, off
return


; ���۳� â �����ֱ�
rectangle:
	
	MouseGetPos, mx2, my2


	GuiControl,, Chart_%CHART_NUM%_1, %mx1%,%my1%
	GuiControl,, Chart_%CHART_NUM%_2, %mx2%,%my2%
	
	;winset,redraw,,ahk_id %win%
	;drawrect(x1,y1,x2,y2)


	w := mx2 - mx1 ;300
	h := my2 - my1 ;300
	thickness := 10

	
	Gui, NewWindowName%CHART_NUM%: New
	; Gui, Add, Text, X0 Y0 w%w% h%h% Border Center GuiMove, %CHART_NUM%%CHART_NUM%
	Gui, Add, Text, X0 Y0 w%w% h%h% Border Center , %CHART_NUM%%CHART_NUM%

	Gui,  +AlwaysOnTop -Caption ;

	Gui, Color, red

	; Show the window
	Gui, Show, autosize x%mx1% y%my1% w%w% h%h%

	

	dw := w - thickness
	dh := h - thickness
	WinSet, Region, 0-0 %w%-0 %w%-%h% 0-%h% 0-0   %thickness%-%thickness% %dw%-%thickness% %dw%-%dh% %thickness%-%dh% %thickness%-%thickness%, A

	
	
	

	


/*
	;CoordMode, Screen

	Width :=600, Height := 480
	; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
	Gui, NewWindowName: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs

	; Show the window
	Gui, NewWindowName: Show, NA


	; Get a handle to this window we have created in order to update it later
	;Winget,hwnd1,ID,ahk_exe notepad.exe
	hwnd1 := WinExist()

	; Create a gdi bitmap with width and height of what we are going to draw into it. This is the entire drawing area for everything
	hbm := CreateDIBSection(Width, Height)

	; Get a device context compatible with the screen
	hdc := CreateCompatibleDC()

	; Select the bitmap into the device context
	obm := SelectObject(hdc, hbm)

	; Get a pointer to the graphics of the bitmap, for use with drawing functions
	G := Gdip_GraphicsFromHDC(hdc)

	; Set the smoothing mode to antialias = 4 to make shapes appear smother (only used for vector drawing and filling)
	Gdip_SetSmoothingMode(G, 4)

	; Create a fully opaque red brush (ARGB = Transparency, red, green, blue) to draw a circle
	pBrush := Gdip_BrushCreateSolid(0xffff0000)


	; Create a slightly transparent (66) blue brush (ARGB = Transparency, red, green, blue) to draw a rectangle
	;pBrush := Gdip_BrushCreateSolid(0x660000ff)


	; Fill the graphics of the bitmap with a rectangle using the brush created
	; Filling from coordinates (250,80) a rectangle of 300x200
	; Gdip_FillRectangle(G, pBrush, 10, 10, 300, 200)
	;Gdip_DrawRectangle(G, pBrush, 10, 10, 300, 200)
	Gdip_FillRoundedRectangle(G, pBrush, 10, 10, 300, 200, 20)



	; Update the specified window we have created (hwnd1) with a handle to our bitmap (hdc), specifying the x,y,w,h we want it positioned on our screen
	; So this will position our gui at (0,0) with the Width and Height specified earlier
	UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)

	; Select the object back into the hdc
	SelectObject(hdc, obm)

	; Now the bitmap may be deleted
	DeleteObject(hbm)

	; Also the device context related to the bitmap may be deleted
	DeleteDC(hdc)

	; The graphics may now be deleted
	Gdip_DeleteGraphics(G)





	; Delete the brush as it is no longer needed and wastes memory
	Gdip_DeleteBrush(pBrush)
*/


	
return 






f_new_window() {

	Gui, NewWindowName: New
	Gui, +AlwaysOnTop -Caption
	

	



	Gui, Font, underline


	CoordMode, Relative
	Gui, Add, Text, X0 Y0 W375 H400 cBlue Border, ������ �⵿�Ϸ��� ���⸦ Ŭ���Ͻʽÿ�.

	; �������, Link ��Ʈ���� ����� �� �ֽ��ϴ�:
	;Gui, Add, Link,, ������ �⵿�Ϸ��� <a href="www.google.com">���⸦</a> Ŭ���Ͻʽÿ�.
	
	
	Gui, Font, norm

	CoordMode, Screen

	
	Gui, Show, X50 Y50 W375 H400 

	WinSet, Transparent, 255, A
	return
}






