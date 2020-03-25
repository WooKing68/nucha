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

; 타이머 off 값이 1이면 타이머 작동이 멈춤
global TIMER1_OFF := 0
global TIMER2_OFF := 0
global TIMER3_OFF := 0
global TIMER4_OFF := 0


global CHART_NUM := 1
global BUY_SELL_COLOR_NUM := 1

global BUY_SELL_COLOR_MSG := "'매수' 혹은 '매도' 색깔이 있는 곳에서 `n<Ctrl + LButton>으로 사각형 영역을 설정하세요."

; 1: 시작 중..., 0: 중지 중...
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

CoordMode, Relative  ; 좌표모드를 Relative 활성창 기준으로
Gui, %MAIN_WIN_NAME%:New,, %ATS_TITLE%
Gui, +AlwaysOnTop -SysMenu -Caption
Gui, font, s8 Bold c6E6E6E,
Gui, Add, Text, x1 y1 w330 h25 guiMove vGuiMove,
Gui, Add, Text, x15 y10 w300 h25, FINAL BIG BOSS - Auto Trading System
Gui, Add, Text, cRed x330 y7 w10 h10 gGuiMin vGuiMin, ─
Gui, Add, Text, cRed x350 y5 w10 h10 gGuiClose vGuiClo, x
Gui, Color, F2F2F2
Gui, font, s9 cBlack w500,
Gui, Add, GroupBox, x16 yp+18 w175 h100 cWhite
Gui, Add, Text, xp+10 yp+18 w90 h20 vText매매종목, 매매종목:
Gui, Add, Text, xp yp+27 w90 h20, 주문매체:
Gui, Add, Text, xp yp+27 w90 h20, 매매방향:
Gui, font, s9 w800
Gui, Add, Text, x%GuiX1% yp-55 w%GuiX1% h20 cBlue vItemView Center, 국내선물
Gui, font, s9 w400
Gui, Add, Edit, xp yp+24 w%GuiX1% h20 cBlack Center, HTS 01
Gui, Add, DropDownList, xp yp+26 w%GuiX1% h20 r40 -background choose1 +altsubmit, 모든신호|매수신호|매도신호
Gui, Add, GroupBox, xp+110 yp-68 w80 h100
Gui, Add, Button, x290 y28 w70 h50 gRun vStartBtn, 시작
Gui, font, s8 w400 cRed
Gui, Add, Text, xp+7 yp+57 w70 h15 vInfo,
Gui, font, s8 w600 cA4A4A4
Gui, Add, Text, xp-7 yp+25 w70 h20 cD8D8D8 vModeBtn gWinMaxMin, ▲ 미니모드
Gui, font, s9 w400
Gui, Add, Button, x%itemX% y%itemY% w%itembtnW% h%itembtnH% vBTN1 gItemBtn, 국내선물
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN2 gItemBtn, 크루드오일
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN3 gItemBtn, 나스닥
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN4 gItemBtn, S&P500
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN5 gItemBtn, 유로FX
Gui, Add, Button, x%itemX% yp+25 w%itembtnW% h%itembtnH% vBTN6 gItemBtn, 골드
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN7 gItemBtn, 실버
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN8 gItemBtn, 항셍
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN9 gItemBtn,
Gui, Add, Button, xp+69 yp w%itembtnW% h%itembtnH% vBTN10 gItemBtn,
Gui, Add, GroupBox, x%itemX% yp+30 w277 h30
Gui, Add, Button, xp+276 yp+5 w%itembtnW% h%itembtnH% gSet vSetBtn, 설정

Gui, Add, Tab2, x%GuiX% y250 w345 h135, 거래현황|거래내역|신호로그
Gui, tab, 거래현황  ;Tab1
Gui, Add, ListView, xp+10 yp+30 w325 h95
Gui, tab, 거래내역  ;Tab2
Gui, Add, ListView, xp yp w325 h95
Gui, tab, 신호로그  ;Tab3
Gui, Add, ListView, xp yp w325 h95

;설정 탭
Gui, Add, Tab2, x390 y28 w445 h356, 좌표설정|진입방식|청산방식|시간제어|대하여...

;tab 1 --------------------
Gui, tab, 좌표설정  ;Tab1
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, GroupBox, xp+15 yp+15 w235 h115, 차트선택 및 신호감지 좌표설정
Gui, Add, Checkbox, xp+15 yp+20 w50 h20 vCheckChart1, 차트1
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart2, 차트2
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart3, 차트3
Gui, Add, Checkbox, xp yp+22 w50 h20 vCheckChart4, 차트4
Gui, Add, Edit, xp+60 yp-64 w%CoordW% h%CoordH% vChart_1_1, aaa_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_2_1, bbb_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_3_1, ccc_1
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_4_1, ddd_1
Gui, Add, Edit, xp+50 yp-66 w%CoordW% h%CoordH% vChart_1_2, aaa_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_2_2, bbb_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_3_2, ccc_2
Gui, Add, Edit, xp yp+22 w%CoordW% h%CoordH% vChart_4_2, ddd_2
Gui, Add, Button, xp+55 yp-67 w40 h18 g차트1, 좌표
Gui, Add, Button, xp yp+22 w40 h18 g차트2, 좌표
Gui, Add, Button, xp yp+22 w40 h18 g차트3, 좌표
Gui, Add, Button, xp yp+22 w40 h18 g차트4, 좌표

Gui, Add, GroupBox, x660 y70 w155 h75, 신호감지 색상
Gui, Add, Button, xp+8 yp+20 w50 h20 g매수색상설정, 매수
Gui, Add, Button, xp yp+26 w50 h20 g매도색상설정, 매도
Gui, Add, Text, xp+55 yp-25 w30 h20 vBuySellColor_1 border BackgroundTrans,
Gui, Add, Text, xp yp+25 w30 h20 vBuySellColor_2 border BackgroundTrans,
Gui, Add, Edit, xp+35 yp-25 w50 h20 vBuySellColorValue_1, aaa
Gui, Add, Edit, xp yp+25 w50 h20 vBuySellColorValue_2, bbb

Gui, Add, GroupBox, x660 y140 w155 h45, 신호감지 방식
Gui, Add, Button, xp+40 yp+17 w70 h20 vSignalMethod gSMothod, 차트개별

Gui, Add, GroupBox, x415 y190 w0 h0 vViewGBox, 신호감지 차트 조합(숫자는 차트 번호)
Gui, Add, Text, xp+32 yp+25 w0 h0 vChk1, 1
Gui, Add, Text, xp+110 yp w0 h0 vChk2, 2
Gui, Add, Text, xp+110 yp w0 h0 vChk3, 3
Gui, Add, Text, xp+110 yp w0 h0 vChk4, 4

Gui, Add, Button, x487 yp-3 w0 h0 vPulsbtn1, +
Gui, Add, Button, xp+110 yp w0 h0 vPulsbtn2, +
Gui, Add, Button, xp+110 yp w0 h0 vPulsbtn3, +

Gui, Add, GroupBox, x415 y295 w200 h70, 주문버튼 좌표 설정
Gui, Add, Text, xp+10 yp+22 w40 h15, 매수:
Gui, Add, Edit, xp+35 yp-2 w%CoordW% h%CoordH% ,
Gui, Add, Edit, xp+50 yp w%CoordW% h%CoordH%,
Gui, Add, Text, xp-85 yp+22 w40 h15, 매도:
Gui, Add, Edit, xp+35 yp-2 w%CoordW% h%CoordH%,
Gui, Add, Edit, xp+50 yp w%CoordW% h%CoordH%,
Gui, Add, Button, xp+54 yp-22 w40 h18, 좌표
Gui, Add, Button, xp yp+21 w40 h18, 좌표

Gui, Add, GroupBox, x630 y295 w125 h70, 주문매체 설정
Gui, Add, Button, xp+15 yp+21 w95 h30 vGetTP gGetTradingProgram, SETUP

;tab 2 --------------------
Gui, tab, 진입방식  ;Tab2
Gui, Add, GroupBox, x400 y55 w425 h320

;tab 3 --------------------
Gui, tab, 청산방식  ;Tab3
Gui, Add, GroupBox, x400 y55 w425 h320

;tab 4 --------------------
Gui, tab, 시간제어  ;Tab4
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, Checkbox, xp+20 yp+15 w140 h20, 동작시간 제어 사용
Gui, Add, GroupBox, xp yp+25 w140 h65, 국내선물/옵션
Gui, Add, Text, xp+10 yp+20 w60 h20, 시작시간:
Gui, Add, Text, xp yp+20 w60 h20, 종료시간:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 09:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 15:00:00
Gui, Add, GroupBox, xp-75 yp+35 w140 h65, 해외선물
Gui, Add, Text, xp+10 yp+20 w60 h20, 시작시간:
Gui, Add, Text, xp yp+20 w60 h20, 종료시간:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 09:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 22:00:00 

Gui, Add, Checkbox, xp+110 yp-140 w140 h20, 금지시간 제어 사용
Gui, Add, GroupBox, xp yp+25 w140 h65, 금지시간1
Gui, Add, Text, xp+10 yp+20 w60 h20, 시작시간:
Gui, Add, Text, xp yp+20 w60 h20, 종료시간:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 12:55:00
Gui, Add, Edit, xp yp+20 w50 h18, 14:00:00
Gui, Add, GroupBox, xp-75 yp+35 w140 h65, 금지시간2
Gui, Add, Text, xp+10 yp+20 w60 h20, 시작시간:
Gui, Add, Text, xp yp+20 w60 h20, 종료시간:
Gui, Add, Edit, xp+65 yp-20 w50 h18, 16:30:00
Gui, Add, Edit, xp yp+20 w50 h18, 18:00:00

;tab 5 --------------------
Gui, tab, 대하여...  ;Tab5
Gui, Add, GroupBox, x400 y55 w425 h320
Gui, Add, Text, xp+10 yp+15 w200 h20, 제작: FINAL BIG BOSS Technology


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

차트1:
	CHART_NUM := 1
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

차트2:
	CHART_NUM := 2
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

차트3:
	CHART_NUM := 3
	f_MsgBox(BUY_SELL_COLOR_MSG)
return

차트4:
	CHART_NUM := 4
	f_MsgBox(BUY_SELL_COLOR_MSG)
return


매수색상설정:
	Gui, submit, nohide
	

	BUY_SELL_COLOR_NUM := 1
	MsgBox, 0x1000,, 매수색상설정: `n매수신호 화살표에 마우스 커서를 가져간 다음 "Esc" 를 누르세요!, 5
return

매도색상설정:
	Gui, submit, nohide
	

	BUY_SELL_COLOR_NUM := 2
	MsgBox, 0x1000,, 매도색상설정: `n매도신호 화살표에 마우스 커서를 가져간 다음 "Esc" 를 누르세요!, 5
return






uiMove: 

	Gui, submit, nohide
   ; 마우스 드래그
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
    GuiControl, Text, SetBtn, 설정
	GuiControl, Move, GuiMin, x330
	GuiControl, Move, GuiClo, x350
	GuiControl, Move, GuiMove, w330
	SetBtn := 0
}
else
{
	Gui, Show, w850 h400, %FBB_Title%
    GuiControl, Text, SetBtn, ◀
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
    GuiControl, Text, ModeBtn, ▲ 미니모드
	ModeBtn := 0
}
else
{
	Gui, Show, w375 h135 %FBB_Title%
    GuiControl, Text, ModeBtn, ▼ 기본모드
	GuiControl, Text, SetBtn, 설정
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
		GuiControl, Text, startBtn, 시작
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
		GuiControl, Text, startBtn, 중지	
		PROG_START := 1	
		GuiControl, Text, Info, 작동 중......

		TIMER1_OFF := 0
		TIMER2_OFF := 0
		TIMER3_OFF := 0
		TIMER4_OFF := 0

		;f_MsgBox("프로그램 시작...")

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
		GuiControl, %MAIN_WIN_NAME%:, Info, 작동 중...
		INFO_STR := "작동 중..."
	}
	else {
		GuiControl, %MAIN_WIN_NAME%:, Info, 
		INFO_STR := ""
	}


	;f_MsgBox("Hello")



	GuiControlGet,CheckBoxState,,CheckChart1 ; %MAIN_WIN_NAME%:
	

	if (CheckBoxState == 1) {
		; 매수신호
		CoordMode, pixel, screen
		PixelSearch, OutputVarX, OutputVarY, %CHART1_X1%, %CHART1_Y1%, %CHART1_X2%, %CHART1_Y2%, %CHART1_BUY_COLOR%, 0, Fast RGB

		if ErrorLevel {
			MsgBox, 4096, 정보창, 못찾음, 5
		}
		Else {
			;MsgBox, 4096, 정보창, 찾음, 5
			;MouseMove, %OutputVarX% , %OutputVarY% 
			Tooltip, "찾았음"
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
    GuiControl, Text, SignalMethod, 차트개별
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
    GuiControl, Text, SignalMethod, 차트조합
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
		
	GuiControlGet, CtrlName, Focus  ;컨트롤의 설정이름을 얻는다 BTN1  Focus : 컨트롤의 내장이름 Button3을 얻는다.
	btnName := CtrlName
	ControlGetText, getText, %btnName%, A   ;GuiControlGet에서 FocusV로 하면 안되고 내장컨트롤이름을 얻는 Focus로 해야함.
	GuiControl, Text, ItemView, %getText%   ;ControlGetText에서 얻은 값으로 해당 컨트롤의 Text로 변경한다.

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
MsgBox, 0x1000,, "사용할 HTS 프로그램의 타이틀바를 선택(마우스 좌 더블클릭) 하세요!", 5

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
	PixelGetColor, pixelColor, %MouseX%, %MouseY%, RGB  ;;;RGB 옵션을 주지 않으면 BGR, 즉 청색, 녹색, 적색 순으로 나온다.

	StringMid, aRed, pixelColor, 3, 2
	StringMid, aGreen, pixelColor, 5, 2
	StringMid, aBlue, pixelColor, 7, 2

	myColorHex := aRed . aGreen . aBlue

	; Gui 컨트롤을 다양하게 변경한다.
	GuiControl, %MAIN_WIN_NAME%: +c%myColorHex% +Redraw, BuySellColor_%BUY_SELL_COLOR_NUM%
	GuiControl, %MAIN_WIN_NAME%: Text, BuySellColor_%BUY_SELL_COLOR_NUM%, s12 bold
	GuiControl, %MAIN_WIN_NAME%:, BuySellColor_%BUY_SELL_COLOR_NUM%, ■■

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


; 구멍난 창 보여주기
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
	Gui, Add, Text, X0 Y0 W375 H400 cBlue Border, 구글을 기동하려면 여기를 클릭하십시오.

	; 대안으로, Link 콘트롤을 사용할 수 있습니다:
	;Gui, Add, Link,, 구글을 기동하려면 <a href="www.google.com">여기를</a> 클릭하십시오.
	
	
	Gui, Font, norm

	CoordMode, Screen

	
	Gui, Show, X50 Y50 W375 H400 

	WinSet, Transparent, 255, A
	return
}


#ESC::
	ExitApp



