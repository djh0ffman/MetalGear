;----------------------------------------------------------------------------
;
; Set up demo mode
; There	are 4 modes: gameplay 1, tutorial, gameplay 2, tutorial
;
;----------------------------------------------------------------------------

SetupDemoPlay:
		    call    ClearGameVars_

		    ld	    a, (+vars.DemoPlayId)
		    inc	    a
		    and	    3
		    ld	    (+vars.DemoPlayId), a		    ; Select demo mode scene

		    ld	    de,	idxDemoPlayCtrl
		    call    GetPointerDE2A_		    ; Get presaved controls of game demo scene

		    ld	    a, (de)			    ; First action/control hold	time
		    ld	    (+vars.DemolHoldTime), a
		    inc	    de
		    ld	    a, (de)			    ; First action/controls data (e.g.:	UP pressed)
		    call    StoreControls__
		    ld	    (+vars.DemoDataPointer), de	    ; Pointer to presaved demo controls

; Set up game demo scene
		    ld	    a, (+vars.DemoPlayId)
		    dec	    a
		    jr	    z, SetDemoPlay1		    ; Demo gameplay 1

		    dec	    a
		    jr	    z, SetTutorialDemo		    ; Game tutorial

		    dec	    a
		    jr	    z, SetDemoPlay2		    ; Demo gameplay 2

;----------------------------------------------------------------------------
;
; Set up game tutorial (radio mode)
;
;----------------------------------------------------------------------------

SetTutorialDemo:
		    call    SetMenuWeaponPal_
		    call    LoadGameGfx_

		    ld	    a, FREQ_BIGBOSS		    ; Radio frequency: Big Boss
		    ld	    (+vars.RadioFreq), a

		    ld	    a, 10h
		    ld	    (+vars.Life), a			    ; +vars.Life value

		    call    DrawRadio_			    ; Draw radio screen

		    ld	    a, 10h
		    ld	    (+vars.RadioLedDelay), a		    ; Delay before the first/next led turns on

		    xor	    a
		    ld	    (+vars.TutorialStatus), a
		    ld	    (+vars.RadioLedCnt), a
		    ld	    (+vars.EquipRadioStatus),	a	    ; Equip and	radio status
		    jr	    SetDemoPlay6


;----------------------------------------------------------------------------
;
; Set up gameplay demo 1
;
;----------------------------------------------------------------------------

SetDemoPlay1:
		    ld	    a, 5
		    ld	    (+vars.Room), a
		    jr	    SetDemoPlay3


;----------------------------------------------------------------------------
;
; Set up gameplay demo 2
;
;----------------------------------------------------------------------------

SetDemoPlay2:
		    ld	    a, 31
		    ld	    (+vars.Room), a

		    ld	    a, HAND_GUN
		    ld	    (+vars.SelectedWeapon), a
		    ld	    (+vars.WeaponInUse), a
		    ld	    (+vars.Weapons), a

SetDemoPlay3:
		    call    InitGame_			    ; Initialize game status (first room, door status...)

		    ld	    a, (+vars.MusicInDemoMode)	    ; Flag to enable or	disable	music in demo mode
		    and	    a
		    jr	    nz,	SetDemoPlay4		    ; Skip music

		    ld	    a, 2Ch			    ; Theme of Tara music
		    ld	    (+vars.AreaMusic), a
		    call    SetSound_

SetDemoPlay4:
		    ld	    a, (+vars.DemoPlayId)
		    cp	    2				    ; Gameplay 1 or 2?
		    ld	    de,	1070h			    ; Start coordinates
		    jr	    c, SetDemoPlay5

		    ld	    de,	7028h			    ; Start coordinates

SetDemoPlay5:
		    ld	    hl,	+vars.PlayerY
		    ld	    (hl), e			    ; Player Y
		    inc	    hl
		    inc	    hl
		    ld	    (hl), d			    ; Player X

SetDemoPlay6:
		    ld	    a, 1
		    ld	    (+vars.PlayingFlag), a
		    ret


;----------------------------------------------------------------------------
;
; Game demo logic
;
; There	are two	modes: gameplay	and tutorial (radio)
;
;----------------------------------------------------------------------------

GameDemoLogic:
		    ld	    a, (+vars.DemoPlayId)
		    rra					    ; Tutorial mode?
		    jp	    c, GameLogic_		    ; Gameplay mode

		    ld	    a, (+vars.TutorialStatus)
		    dec	    a
		    jr	    z, ShowGameTutorial		    ; Show tutorial

		    dec	    a
		    jr	    z, TutorialDummy

		    call    RadioSignalUp_		    ; Radio signal leds	effect

		    ld	    a, (+vars.EquipRadioStatus)	    ; Equip and	radio status
		    dec	    a				    ; Are all the radio	signal leds on?
		    ret	    nz

		    call    NextTutorialStatus

		    ld	    a, 36			    ; Tutorial text
		    jp	    SetTextUnskip_		    ; Set textbox mode


ShowGameTutorial:
		    call    TextBoxLogic_		    ; Show text	of the tutorial

		    ld	    a, (+vars.GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_RADIO
		    ret	    nz				    ; The tutorial has not ended yet

NextTutorialStatus:
		    ld	    hl,	+vars.TutorialStatus
		    inc	    (hl)

TutorialDummy:
		    ret


;----------------------------------------------------------------------------
;
; Demo control:	replay saved actions/controls
;
;----------------------------------------------------------------------------

DemoControler:
		    ld	    hl,	+vars.DemolHoldTime
		    dec	    (hl)			    ; Decrement	action/control hold time
		    jr	    nz,	DemoControler2

		    ld	    hl,	(+vars.DemoDataPointer)	    ; Pointer to presaved demo controls
		    inc	    hl
		    ld	    a, (hl)			    ; Get action/control hold time
		    cp	    0FFh			    ; End demo?
		    jr	    z, EndDemoMode

		    ld	    (+vars.DemolHoldTime), a
		    inc	    hl
		    ld	    (+vars.DemoDataPointer), hl	    ; Pointer to presaved demo controls

DemoControler2:
		    ld	    hl,	(+vars.DemoDataPointer)	    ; Pointer to presaved demo controls
		    ld	    a, (hl)			    ; Action/control data
		    jp	    StoreControls__		    ; Simulate controls	pressed


EndDemoMode:
		    xor	    a
		    ld	    (+vars.PlayingFlag), a
		    ret



;----------------------------------------------------------------------------
;
; Recorded controls for	demo modes
;
;----------------------------------------------------------------------------
idxDemoPlayCtrl:    dw DemoTutorial
		    dw DemoGameplay1
		    dw DemoTutorial
		    dw DemoGameplay2


	IF	(JAPANESE)
DemoGameplay1:      db  23h,   8,   4,   0,   2,   2,0A8h,   0, 0Bh,   2, 0Ch,   8,   5,   1, 10h,   0, 0Eh,   4
		    db    6,   1, 14h,   4, 70h,   0, 2Ch,   8, 0Ah,   0, 49h,   4,   9,   2, 4Eh,   0,   2, 20h
		    db  0Ah,   0,   3, 20h, 0Ah,   0, 10h, 20h,   6,   2, 49h,   4, 42h,   1,0FFh
		    
DemoTutorial:       db    0,   0,   0,   0,   0,   0,   0,   0,0FFh

DemoGameplay2:      db  1Fh,   0, 3Ah,   2, 0Dh,   8, 10h,   4, 5Eh,   2, 1Ah,   4, 10h,   1, 16h,   4, 22h,   1 ; ...
		    db  33h,   0,   5,   2, 18h, 12h, 12h,   4,   2,   8,   4,   8,   1, 10h,   9,   8,   1, 10h
                    db    4,   8,0FFh
	ELSE
DemoGameplay1:	    db	23h,   8,   4,	 0,   2,   2,0A8h,   0,	0Bh,   2, 0Ch,	 8,   5,   1, 10h,   0
		    db	0Eh,   4,   6,	 1, 14h,   4, 42h,   0,	28h,   8, 0Ah,	 0, 49h,   4,	9,   2
		    db	4Eh,   0,   2, 20h, 0Ah,   0,	3, 20h,	0Ah,   0, 10h, 20h,   6,   2, 49h,   4
		    db	42h,   1,0FFh
		    
DemoTutorial:	    db	  0,   0,   0,	 0,   0,   0,	0,   0,	80h,   0,0FFh

DemoGameplay2:	    db	1Fh,   0, 3Ah,	 2, 0Dh,   8, 10h,   4,	5Eh,   2, 1Ah,	 4, 10h,   1, 16h,   4
		    db	1Ch,   1, 1Eh,	 0,   5,   2, 18h, 12h,	12h,   4,   2,	 8,   4,   8,	1, 10h
		    db	  9,   8,0FFh
    	ENDIF
