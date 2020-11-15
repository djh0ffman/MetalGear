
;----------------------------------------------------------------------------
;
; Variables
;
;----------------------------------------------------------------------------

		    STRUCT vars,$c000
		    
GameStatus:	    TEXT 1
GameSubstatus:	    TEXT 1
ControlConfig:	    TEXT 1
							    ; Bit6: 1=Enable music/Player control
TickCounter:	    TEXT 1
WaitCounter:	    TEXT 1
TickInProgress:	    TEXT 1
ControlsTrigger:    TEXT 1
							    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
ControlsHold:	    TEXT 1
							    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
Pause_1_F5_2:	    TEXT 1
TutorialStatus:	    TEXT 1
DemolHoldTime:	    TEXT 1
UnusedVar1:	    TEXT 1
DemoPlayId:	    TEXT 1
DemoDataPointer:    TEXT 2
							    ; Pointer to presaved demo controls
SprShuffleOffset:   TEXT 1

;
; Sound	work area
; 3 music channels + 1 sfx
;
SoundWorkArea:	    TEXT 20h
SoundWorkAreaB:	    TEXT 20h
SoundWorkAreaC:	    TEXT 20h
SoundWorkAreaSfx:   TEXT 20h

SoundWorkArea2:	    TEXT 60h
							    ; Sound work area backup


PGS_MixerVal:	    TEXT 1
RestoreSoundData:   TEXT 1
SoundDataSaved:	    TEXT 1
flagSndDatRestored: TEXT 1
MusicToSet:	    TEXT 1
							    ; New music	to play	(fade out current one)
FadeStepCnt:	    TEXT 1
VolumeFadeVal:	    TEXT 1
UnusedVar2:         TEXT 1
MuteSoundFlag:	    TEXT 1
							    ; 1	= Mute
RadioFreqOffset:    TEXT 1
							    ; Value used to modify the radio noise SFX depending on radio frequency
UnusedVar3:         TEXT 1
BigBossDeadSnd:	    TEXT 1
UnusedVar4:         TEXT 14h


ControlsTrig_:	    TEXT 1
ControlsHold_:	    TEXT 1
FKeysTrigger:	    TEXT 1
							    ; 0	0 RET F5 F4 F3 F2 F1
FKeysHold:	    TEXT 1
							    ; 0	0 RET F5 F4 F3 F2 F1
SprColAddress:	    TEXT 2
SprAttAddress:	    TEXT 2
MenuStatus:	    TEXT 1
MenuCnt:	    TEXT 1
UnusedVar5:         TEXT 6
GameVars:	    TEXT 3
PlayingFlag:	    TEXT 1
LeavedOuterHeaven:  TEXT 1
RestoreGameFlag:    TEXT 1
UnusedVar6:         TEXT 0Ah
Room:		    TEXT 1
							    ; Also used	as LogoTimer
Life:		    TEXT 1
							    ; LogoCnt
Class:		    TEXT 1
							    ; Logo end flag
NextRoomDirect:	    TEXT 1
							    ; 4=Right, 3=Left, 2=Down, 1=Up
SelectedWeapon:	    TEXT 1
SelectedItem:	    TEXT 1
PreviousRoom:	    TEXT 1
MaxLife:	    TEXT 1
RadioFreq:	    TEXT 1
Poisoned:	    TEXT 1
RescuedCnt:	    TEXT 1
							    ; Rescued prisoners	count (0-4)
EquipRemoved:	    TEXT 1
							    ; The equipment and	weapons	have been removed by the enemy (captured)
DestructionTimerOn: TEXT 1
DestructTimer:	    TEXT 1
DestructTimerH:	    TEXT 1
PrisonWall1Life:    TEXT 1
							    ; Snake prison wall	energy
PrisonWall2Life:    TEXT 1
							    ; GreyFox prison wall energy
MaxAmmoRatioF:	    TEXT 1
							    ; Bit 0=Max.Ammo, 1=Max.Rations
WeaponInUse:	    TEXT 1
PlayerMovSpeed:	    TEXT 2
UnusedVar7:         TEXT 0Bh
byte_C150:	    TEXT 1
							    ; Unused?
GameMode:	    TEXT 1
							    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
Dificulty:	    TEXT 1
EquipRadioStatus:   TEXT 1
							    ; Equip and	radio status
SelectIdx:	    TEXT 1
MenuCursorXY:	    TEXT 2
CurrentTileSet:	    TEXT 1
IsolatedRoom:	    TEXT 1
							    ; Can't use binoculars. Shooting does not trigger the alarm
AreaMusic:	    TEXT 1
UnusedVar8:         TEXT 1
HeightParachuteCnt: TEXT 1
ControlHoldWait:    TEXT 1
UnusedVar9:         TEXT 1
isOnBridge:	    TEXT 1
RadioCallFlag:	    TEXT 1
							    ; 1=Start incoming call, 2=Stop incoming call
IncomingCallTimer:  TEXT 1
MapZone:	    TEXT 1
							    ; Values of	5 or more need the antenna
JumpRoomId:	    TEXT 1
							    ; 1	= From room 45,	2 = From room 46, others = 117
RadioCallFlagCopy:  TEXT 2
RestoreSavedGame:   TEXT 1
							    ; ;Set after loading tape data
TailDataByte:	    TEXT 1
DoNotAddEnemies:    TEXT 1
TilesetBank:	    TEXT 1
							    ; 0=First bank of 256 tiles, 1=Second bank
CowardDuckSpeech:   TEXT 1
AlertModeCopy2:	    TEXT 1
UnusedVar10:         TEXT 15h
PlayerControlMod:   TEXT 1
							    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
PlayerYdec:	    TEXT 1
PlayerY:	    TEXT 1
PlayerXdec:	    TEXT 1
PlayerX:	    TEXT 1
PlayerDirection:    TEXT 1
							    ; 1=Up, 2 =	Down, 3=Left, 4=Right
PlayerSpeedY:	    TEXT 2
PlayerSpeedX:	    TEXT 2
SnakeSprId:	    TEXT 1
PlayerAnimation:    TEXT 1
							    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
PlayerDirectionNew: TEXT 1
							    ; 1=Up, 2=Down, 3=Left, 4=Right
PlayerAnimWaitCnt:  TEXT 1
StopPlayerFlag:	    TEXT 1
							    ; 1=The player is not moving
PlayerFrameNum:	    TEXT 1
PunchCnt:	    TEXT 1
DirectionMask:	    TEXT 1
							    ; Bitmask of the last pressed direction control
DirectionMaskOld:   TEXT 1
							    ; Bitmask of the previous pressed direction	control
ElevatorY:	    TEXT 1
ElevatorX:	    TEXT 1
ElevatorDir:	    TEXT 1
							    ; 1=up, 2=down
ElevatorStatus:	    TEXT 1
ElevatorLimitUp:    TEXT 1
ElevatorLimitDown:  TEXT 1
DamageDelayTimer:   TEXT 1
BinoculStatus:	    TEXT 1
BinocularDir:	    TEXT 1
TimerBinocular:	    TEXT 1
DeadTimer:	    TEXT 1
SubMachGunTimer:    TEXT 1
BurstCnt:	    TEXT 1
InAirFlow:	    TEXT 1
							    ; 1	= Snake	is being pushed	by the air floor in the	roof
UnusedVar11:        TEXT 1Eh
BombOrderBuffer:    TEXT 10h
CurrentPal:	    TEXT 31h
							    ; Color number, color data1, color data 2... TEXTFF end
PlayerShotsList:    TEXT 1
PlayerShot1Stat:    TEXT 3
PlayerShot1Y:	    TEXT 2
PlayerShot1X:	    TEXT 17Ah

MaxAmmoGun:	    TEXT 2
MaxAmmoSMG:	    TEXT 2
MaxAmmoGrenade:	    TEXT 2
MaxAmmonRocket:	    TEXT 2
MaxAmmoBomb:	    TEXT 2
MaxAmmoMine:	    TEXT 2
MaxAmmoMissile:	    TEXT 2
UnusedVar12:        TEXT 2Ch
MaxRations:	    TEXT 2
UnusedVar13:        TEXT 14h

DoorsList:	    TEXT 80h
							    ; 0=ID, 1=Open, 2=LogicOpen, 3=Type, 4=Cnt,	5=DrawY, 6=DrawX, 7=OpenOffY, 8=OpenNY,	9=OpenOffX, 10=OpenNX, 11=EnterOffY, 12=EnterNY, 13=EnterOffsetX, 14=EnterNY, 15=Destination room

DoorOpenArray:	    TEXT 0A0h
							    ; 0=Open/1=Closed status of	all doors
UnusedVar14:        TEXT 0Ch
IdDoorEnter:	    TEXT 1
OpenDoorStatus:	    TEXT 1
idxDoorOpen:	    TEXT 1
DoorsInRoom:	    TEXT 1
							    ; Number of	doors in the room

Weapons:	    TEXT 1Ch
InvSupressor:	    TEXT 4

WeaponsTaken:	    TEXT 1
SMG_Taken:	    TEXT 1
GrenadeL_Taken:	    TEXT 1
RocketL_Taken:	    TEXT 1
PBomb_Taken:	    TEXT 1
Mines_Taken:	    TEXT 1
Missiles_Taken:	    TEXT 1
SupressorTaken:	    TEXT 1
TextBoxEff_Cnt:	    TEXT 1
TextBoxEff_DY:	    TEXT 1
TextBoxEff_DX:	    TEXT 1
TextBoxStepY:	    TEXT 1
TextBoxStepX:	    TEXT 1
TextBoxEff_NY:	    TEXT 1
TextBoxEff_NX:	    TEXT 1
TextBoxEff_Col:	    TEXT 1


Equipment:	    TEXT 1
							    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
CigarsUnits:	    TEXT 6Fh

ItemsTaken:	    TEXT 1
BSuitTaken:	    TEXT 1
FlashLightTaken:    TEXT 1
GooglesTaken:	    TEXT 1
GasMaskTaken:	    TEXT 1
CigarsTaken:	    TEXT 1
MineDetectTaken:    TEXT 1
AntennaTaken:	    TEXT 1
BinocularTaken:	    TEXT 1
OxygenTaken:	    TEXT 1
CompassTaken:	    TEXT 1
ParachuTaken:	    TEXT 1
AntidoteTaken:	    TEXT 1
Card1Taken:	    TEXT 1
Card2Taken:	    TEXT 1
Card3Taken:	    TEXT 1
Card4Taken:	    TEXT 1
Card5Taken:	    TEXT 1
Card6Taken:	    TEXT 1
Card7Taken:	    TEXT 1
Card8Taken:	    TEXT 1
RationTaken:	    TEXT 1
TransmiTaken:	    TEXT 1
UniformTaken:	    TEXT 1
CardBoardBoxTaken   TEXT 1
EquipBagTaken:	    TEXT 1
UnusedVar15:        TEXT 6
SpawnedItems:	    TEXT 1
SpawnItemData:	    TEXT 0Fh
							    ; Item ID, Y, X  (TEXTFF = End	list)
ItemsInTheRoom:	    TEXT 30h
							    ; ID, size,	Y, X
GameDataArea:	    TEXT 2
AlertMode:	    TEXT 2
RoomAlert:	    TEXT 1
							    ; The room where the alert started
AlertRespawnTimer:  TEXT 1
NumRespawnGuards:   TEXT 2
EventCnt:	    TEXT 1
NumEnemies:	    TEXT 1
LaserRoomTimer:	    TEXT 1
							    ; Wait time	before moving lasers
LaserRoomCnt:	    TEXT 1
							    ; Laser position counter
XY_AlertIcon:	    TEXT 3
RoomAlertTrigged:   TEXT 1
							    ; This is the room where the alert was triggered
OpenBigBossDoor:    TEXT 1
							    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.
UnusedVar16:        TEXT 3
RedAlertFlag:	    TEXT 2
PowerSwitchOn:	    TEXT 1
							    ; Power switch status 1=On,	0=Off/destroyed
UnusedVar17:        TEXT 9
BossHindD_KO:	    TEXT 1
BossTank_KO:	    TEXT 1
Bulldozer_KO:	    TEXT 1
MetalGear_KO:	    TEXT 1
							    ; Metal Gear destroyed. Self destruction activated
UnusedVar18:        TEXT 2
ArnoldsCnt:	    TEXT 1
FireTrooper_KO:	    TEXT 1
REMOVE_FLAMES:	    TEXT 4					; Not used
DoorBuild2LockedF:  TEXT 1
							    ; 0	= Entrance door	of building 2 is closed. 1 = Open
byte_C62D:	    TEXT 1
NumBasementDogs:    TEXT 1
NoEnemiesRoom:	    TEXT 1
							    ; 1=No enemies in the room
MachGunStatus:	    TEXT 1
							    ; Bit1= Machine Gun	Kid speech, 0=Dead
ShotGunnerStat:	    TEXT 1
							    ; Bit1=Shot	Gunner speech, 0=Dead
AlertModeCopy:	    TEXT 1
SleepyGuardFlag:    TEXT 1
Guard1ExitedLorry:  TEXT 1
Guard2ExitedLorry:  TEXT 1
Guard3ExitedLorry:  TEXT 1
BigBossStat:	    TEXT 1
							    ; 0=Dead, 1=Confession dialog
GuardSilencerCnt:   TEXT 1
							    ; Four soldiers (supressor room)
PowerSwitchOnCopy:  TEXT 1
DesertGuardsTextF:  TEXT 1
PowerSwitchY:	    TEXT 1
PowerSwitchX:	    TEXT 4
RescuedArray:	    TEXT 17h
JennifBrotherDead:  TEXT 9
MadnarMoved:	    TEXT 1
JeniRocketF:	    TEXT 1
SchneiderCaptured:  TEXT 1
JeniOpenDoorF:	    TEXT 1
							    ; Flag to open the door to the compass room
SwitchOffMSXF:	    TEXT 4
							    ; 1	= Big Boss will	order to switch	off your MSX
AlertSignNotOnScreen: TEXT	1
							    ; 1	= No need to erase the alert sign. The alert was triggered by a	camera
AlertIconTimer:	    TEXT 37h
SaveLoadMode:	    TEXT 1
							    ; 1=Load mode, 2=Save mode
SaveLoadStat:	    TEXT 1
FilenameFound:	    TEXT 6
Filename:	    TEXT 6
FilenameSize:	    TEXT 52h
CollisionTiles:	    TEXT 100h
							    ; Collision	property of the	tiles (bit 0 = 1 collision)
RadioCmd:	    TEXT 1
							    ; 1=Send
RadioLedCnt:	    TEXT 1
RadioLedDelay:	    TEXT 1
							    ; Delay before the first/next led turns on
ReplyRadioPerson:   TEXT 2
AutoReplyDone:	    TEXT 1
							    ; Flag to indicate that autoreply has been done.
ReplyRequested:	    TEXT 79h
NumRadioPersons:    TEXT 1
RadioPersonsDat:    TEXT 80h
							    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id
CaptureStatus:	    TEXT 1
CaptureTimer:	    TEXT 1Fh
IntroSceneStatus:   TEXT 1
IntroSceneCnt:	    TEXT 1
EndingStatus:	    TEXT 1
EndingCnt:	    TEXT 5
TempImpactInfo:	    TEXT 0D8h
							    ; Buffer used to store the shape/size of an	actor
GameProgressBuffer: TEXT 220h
							    ; The last byte is the checksum
GfxPitfallBuffer:   TEXT 2C0h
							    ; Buffer used to unpack the	pitfall	tiles
SkipTextMode:	    TEXT 1
							    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box
LorryMovTextF:	    TEXT 2
SkipTextF:	    TEXT 0Dh
TextId:		    TEXT 1
PrevGameMode:	    TEXT 1
TextWindowStatus:   TEXT 1
TextPointer:	    TEXT 2
TextBoxType:	    TEXT 1
							    ; High nibble = Show prompt	icon, low nibble = Window type
							    ; Window types:
							    ; 0	- 1 x 7
							    ; 1	- 3 x 19
							    ; 2	- 5 x 16
							    ; 3	- 5 x 23
							    ; 4	- 2 x 17
TextY:		    TEXT 1
TextX:		    TEXT 1
TextNY:		    TEXT 1
TextNX:		    TEXT 1
PendingTextFlag:    TEXT 1
WaitTextCnt:	    TEXT 1
TextCharXY:	    TEXT 2
pTexBuffer:	    TEXT 2
PromptXY:	    TEXT 2
flagTxtItem:	    TEXT 0Eh	
TextBuffer:	    TEXT 0F0h
EnemyList:	    TEXT 80h				    ; Array of enemies in the room
EnemyListEntry1:    TEXT 80h
EnemyListEntry2:    TEXT 700h
EnemyListCopy:	    TEXT 800h				    ; Used when	entering binoculars mode
RoomTileBuffer:	    TEXT 500h
PasswordBuffer:	    TEXT 0Ch
PassKeysTrigger:    TEXT 1
KeyboardRow7:	    TEXT 1
KeyboardRow6:	    TEXT 1
KeyboardRow5:	    TEXT 1
KeyboardRow4:	    TEXT 1
KeyboardRow3:	    TEXT 1
KeyboardRow2:	    TEXT 1
KeyboardRow1:	    TEXT 1
KeyboardRow0:	    TEXT 1
PassKeysHold:	    TEXT 0EBh
SavedTilesBuffer:   TEXT 100h				    ; Buffer used to save the background tiles of a tileblock
BufferColor:	    TEXT 8					    ; Buffer used to store the colors' indexes for decoding 2/3bpp graphics
BufferGfx:	    TEXT 0F8h				    ; Buffer used to decode 2bpp and 3bpp graphics

; Sprites colors
SpritesColors:	    TEXT 40h
BinocularSprCol:    TEXT 50h
GrenadTargetCol:    TEXT 0B0h
SprElevatorCol:	    TEXT 0C0h

; Sprites attributes
; Y, X,	pattern, EarlyClock+color
SprAttRAM:	    TEXT 10h
SprShootsAtt:	    TEXT 14h
GrenaTargetAtt:	    TEXT 4
EnemySprAttRAM:	    TEXT 18h
SnakeAttrLow:	    TEXT 10h
SprElevatorAttr:    TEXT 1B0h


TempData:	    TEXT 2
TempData2:	    TEXT 2					    ; Enemy XY,	MetaTileSetAddr
TempData3:	    TEXT 2					    ; MetaTiles, Enemy
MetatilesNX:	    TEXT 3Ah
DecodeTileBuf:	    TEXT 40h
ShotSpeed:	    TEXT 1
ShotDirectionV:	    TEXT 1
ShotDirectionH:	    TEXT 1
TmpShootSpeedY:	    TEXT 2
TmpShotCos:	    TEXT 1
QuadranDegree:	    TEXT 46Ah
Stack:		    TEXT 1
BankIn60:	    TEXT 1
							    ; Copy of bank selected in TEXT6000-TEXT7FFF
BankIn80:	    TEXT 1
							    ; Copy of bank selected in TEXT8000-TEXT9FFF
BankInA0:	    TEXT 1
							    ; Copy of bank selected in TEXTA000-TEXTBFFF
BankIn60Fixed:	    TEXT 1
BankIn80Fixed:	    TEXT 1
BankInA0Fixed:	    TEXT 1

MusicInDemoMode:    TEXT 1
							    ; Flag to enable or	disable	music in demo mode
FKeysTriggerMen:    TEXT 1
FKeysHoldMenu:	    TEXT 1					    ; 0	0 RET F5 F4 F3 F2 F1

 ENDS