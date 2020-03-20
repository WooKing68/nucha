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

CoordMode, Relative  ; 좌표모드를 Relative 활성창 기준으로
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
Gui, Add, Checkbox, xp+15 yp+20 w50 h20, 차트1
Gui, Add, Checkbox, xp yp+22 w50 h20, 차트2
Gui, Add, Checkbox, xp yp+22 w50 h20, 차트3
Gui, Add, Checkbox, xp yp+22 w50 h20, 차트4
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



차트1:
	CHART_NUM := 1
return

차트2:
	CHART_NUM := 2
return

차트3:
	CHART_NUM := 3
return

차트4:
	CHART_NUM := 4
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


uiMove:    ; 마우스 드래그
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
if (startBtn == 1)
{    
    GuiControl, Text, startBtn, 시작
	GuiControl, Text, Info,
	startBtn := 0
	SetTimer, S_Search, Off
}
else
{    
    GuiControl, Text, startBtn, 중지	
	startBtn := 1	
	GuiControl, Text, Info, 작동 중......
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
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%, RGB  ;;;RGB 옵션을 주지 않으면 BGR, 즉 청색, 녹색, 적색 순으로 나온다.
	;MsgBox The color at the current cursor position is %color%.
	;GuiControl, +c%color%  +Redraw, Text매매종목
	
	;Gui, Color,, Navy ; Edit Background Color
	;Gui, Font, cWhite ; Font Color
	GuiControl, +c%color% +Redraw, BuySellColor_%BUY_SELL_COLOR_NUM%
	GuiControl, Text, BuySellColor_%BUY_SELL_COLOR_NUM%, s12 bold
	GuiControl,, BuySellColor_%BUY_SELL_COLOR_NUM%, ■■

	

	

	GuiControl,, BuySellColorValue_%BUY_SELL_COLOR_NUM%, %color%

	;GuiControl +BackgroundFF9977, Text매매종목

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


; 구멍난 창 보여주기
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
	Gui, Add, Text, X0 Y0 W375 H400 cBlue Border, 구글을 기동하려면 여기를 클릭하십시오.

	; 대안으로, Link 콘트롤을 사용할 수 있습니다:
	;Gui, Add, Link,, 구글을 기동하려면 <a href="www.google.com">여기를</a> 클릭하십시오.
	
	
	Gui, Font, norm

	CoordMode, Screen

	
	Gui, Show, X50 Y50 W375 H400 

	WinSet, Transparent, 255, A
	return
}






