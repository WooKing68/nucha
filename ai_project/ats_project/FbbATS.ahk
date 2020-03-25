#SingleInstance ignore
#WinActivateForce

global PROG_START := 0
global INFO_STR := ""



;#Include, %A_ScriptDir%\Gdip.ahk
;pToken := Gdip_Startup()


global SideThickness := 2
global TitleThickness := 20

global CHART1_X1 := 0
global CHART1_Y1 := 0
global CHART1_X2 := 0
global CHART1_Y2 := 0
global CHART1_BUY_COLOR := 0
global CHART1_SELL_COLOR := 0

; Ÿ�̸� off ���� 1�̸� Ÿ�̸� �۵��� ����
global TIMER1_OFF := 0
global TIMER2_OFF := 0
global TIMER3_OFF := 0
global TIMER4_OFF := 0


global CHART_NUM := 1
global BUY_SELL_COLOR_NUM := 1

global BUY_SELL_COLOR_MSG := "'�ż�' Ȥ�� '�ŵ�' ������ �ִ� ������ `n<Ctrl + LButton>���� �簢�� ������ �����ϼ���."

; 1: ���� ��..., 0: ���� ��...
global START_PROG_NUM := 0

global MAIN_WIN_NAME := "MainWinName"

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


global ATS_TITLE := "FINAL BIG BOSS - Auto Trading System"

CoordMode, Relative  ; ��ǥ��带 Relative Ȱ��â ��������
Gui, %MAIN_WIN_NAME%:New,, %ATS_TITLE%
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
Gui, Add, Checkbox, xp+15 yp+20 w50 h20 vCheckChart1, ��Ʈ1
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart2, ��Ʈ2
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart3, ��Ʈ3
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart4, ��Ʈ4
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


CoordMode, mouse, screen


Return



GuiClose:
	;Gdip_Shutdown(pToken)
ExitApp

BuyColor:
	BUY_SELL_COLOR_NUM := 1
return 


SellColor:
	BUY_SELL_COLOR_NUM := 2
return


f_MsgBox(aMsg) {
	MsgBox, 0x1000,, %aMsg%, 10
}

��Ʈ1:
	CHART_NUM := 1
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

��Ʈ2:
	CHART_NUM := 2
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

��Ʈ3:
	CHART_NUM := 3
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

��Ʈ4:
	CHART_NUM := 4
	f_MsgBox(BUY_SELL_COLOR_MSG)
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






uiMove: 

	Gui, submit, nohide
   ; ���콺 �巡��
	PostMessage, 0xA1, 2,,, A


	KeyWait, LButton, L

	WinGetTitle, Title, A ; 
	;WinGetActiveTitle, Title

	;WinGetPos, X, Y, Width, Height, Calculator
	;MsgBox, Calculator is at %X%`,%Y%

	
	if ( SubStr(Title, 1 , 13)=="NewWindowName" ) {
		WinGetPos , X1, Y1, W, H, %Title%

		X2 := X1 + W
		Y2 := Y1 + H

		myCHART_NUM := SubStr(Title, 14 , 1)

				
		GuiControl,%MAIN_WIN_NAME%:, Chart_%myCHART_NUM%_1, %X1%,%Y1%
		GuiControl,%MAIN_WIN_NAME%:, Chart_%myCHART_NUM%_2, %X2%,%Y2%


		CHART1_X1 := X1 + SideThickness
		CHART1_Y1 := Y1 + TitleThickness
		CHART1_X2 := X2 - SideThickness
		CHART1_Y2 := Y2 - SideThickness

	}
	
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



	if (PROG_START == 1)
	{    
		GuiControl, Text, startBtn, ����
		GuiControl, Text, Info,
		PROG_START := 0

		TIMER1_OFF := 1
		TIMER2_OFF := 1
		TIMER3_OFF := 1
		TIMER4_OFF := 1

		Tooltip,
	}
	else if (PROG_START==0)
	{    
		GuiControl, Text, startBtn, ����	
		PROG_START := 1	
		GuiControl, Text, Info, �۵� ��......

		TIMER1_OFF := 0
		TIMER2_OFF := 0
		TIMER3_OFF := 0
		TIMER4_OFF := 0

		;f_MsgBox("���α׷� ����...")

		;SetTimer,RunChart01, 3000
		gosub RunChart01
		;f_MsgBox("Hello")
	}
return



RunChart01:
    
    Gui, Submit, NoHide

	Tooltip,


	if (TIMER1_OFF==1) {
		TIMER1_OFF := 0
		SetTimer,RunChart01, Off
		return
	}

	if (INFO_STR=="") {
		GuiControl, %MAIN_WIN_NAME%:, Info, �۵� ��...
		INFO_STR := "�۵� ��..."
	}
	else {
		GuiControl, %MAIN_WIN_NAME%:, Info, 
		INFO_STR := ""
	}


	;f_MsgBox("Hello")



	GuiControlGet,CheckBoxState,,CheckChart1 ; %MAIN_WIN_NAME%:
	

	if (CheckBoxState == 1) {
		; �ż���ȣ
		CoordMode, pixel, screen
		PixelSearch, OutputVarX, OutputVarY, %CHART1_X1%, %CHART1_Y1%, %CHART1_X2%, %CHART1_Y2%, %CHART1_BUY_COLOR%, 0, Fast RGB

		if ErrorLevel {
			MsgBox, 4096, ����â, ��ã��, 5
		}
		Else {
			;MsgBox, 4096, ����â, ã��, 5
			;MouseMove, %OutputVarX% , %OutputVarY% 
			Tooltip, "ã����"
		}

	}
	else {

	}

	CoordMode, mouse, screen

	

	SetTimer,RunChart01,500

	
return

RunChart02:
    SetTimer,,Off
    Gui, Submit, NoHide

    ; doSomething()

	;SetTimer,RunChart02,1000
return

RunChart03:
    SetTimer,,Off
    Gui, Submit, NoHide

	; doSomething()

	;SetTimer,RunChart03,1000
    
return

RunChart04:
    SetTimer,,Off
    Gui, Submit, NoHide


	; doSomething()

	;SetTimer,RunChart04,1000
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
	
	CoordMode, mouse, screen
	MouseGetPos, MouseX, MouseY

	CoordMode, pixel, screen
	PixelGetColor, pixelColor, %MouseX%, %MouseY%, RGB  ;;;RGB �ɼ��� ���� ������ BGR, �� û��, ���, ���� ������ ���´�.

	StringMid, aRed, pixelColor, 3, 2
	StringMid, aGreen, pixelColor, 5, 2
	StringMid, aBlue, pixelColor, 7, 2

	myColorHex := aRed . aGreen . aBlue

	; Gui ��Ʈ���� �پ��ϰ� �����Ѵ�.
	GuiControl, %MAIN_WIN_NAME%: +c%myColorHex% +Redraw, BuySellColor_%BUY_SELL_COLOR_NUM%
	GuiControl, %MAIN_WIN_NAME%: Text, BuySellColor_%BUY_SELL_COLOR_NUM%, s12 bold
	GuiControl, %MAIN_WIN_NAME%:, BuySellColor_%BUY_SELL_COLOR_NUM%, ���

	GuiControl,%MAIN_WIN_NAME%:, BuySellColorValue_%BUY_SELL_COLOR_NUM%, %pixelColor%

	if (BUY_SELL_COLOR_NUM==1) {
		CHART1_BUY_COLOR := pixelColor
	}
	else if (BUY_SELL_COLOR_NUM==2) {
		;CHART1_SELL_COLOR := pixelColor
	}

	CoordMode, mouse, screen

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

	CoordMode, mouse, screen
	
	MouseGetPos, mx2, my2


	GuiControl,MainWinName:, Chart_%CHART_NUM%_1, %mx1%,%my1%
	GuiControl,MainWinName:, Chart_%CHART_NUM%_2, %mx2%,%my2%
	
	

	w := mx2 - mx1 ;300
	h := my2 - my1 ;300


	
	
	

	{
		x1 := SideThickness
		y1 := TitleThickness

		x2 := w - SideThickness
		y2 := y1

		x3 := x2
		y3 := h - SideThickness

		x4 := x1
		y4 := y3

		CHART1_X1 := mx1 + SideThickness
		CHART1_Y1 := my1 + TitleThickness
		CHART1_X2 := mx2 - SideThickness
		CHART1_Y2 := my2 - SideThickness
	}

	
	Gui, NewWindowName%CHART_NUM%: New, , NewWindowName%CHART_NUM%
	

	
	Gui, Add, Text, X0 Y0 w%w% h%h% +cWhite guiMove Border Center , %CHART_NUM%

	Gui,  +AlwaysOnTop -Caption ;

	Gui, Color, red

	; Show the window
	Gui, Show, autosize x%mx1% y%my1% w%w% h%h%

	

	

	
	
	WinSet, Region, 0-0 %w%-0 %w%-%h% 0-%h% 0-0   %x1%-%y1% %x2%-%y2% %x3%-%y3% %x4%-%y4% %x1%-%y1%, A
	
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


#ESC::
	ExitApp



