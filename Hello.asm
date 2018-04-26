;=== Include MemoryMap, VectorTable, HeaderInfo ===
.INCLUDE "Hello.inc"

;=== Include Library Routines & Macros ===
.INCLUDE "InitSNES.asm"
.INCLUDE "LoadGraphics.asm"
.INCLUDE "2Input.asm"
.INCLUDE "Strings.asm"
.INCLUDE "QuickSetup.asm"

;=== Global Variables ===

.ENUM $80
	var1	db
	var2	db
.ENDE

;==============================================================================
; main
;==============================================================================

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Main:
	InitializeSNES	

	jsr QuickSetup	; set VRAM, the video mode, background and character pointers, 
				; and turn on the screen

	jsr JoyInit		;setup joypads and enable NMI

	; Set the background color to green.
     sep     #$20        ; Set the A register to 8-bit.
     lda     #%10000000  ; Force VBlank by turning off the screen.
     sta     $2100
     lda     #%11110000  ; Load the low byte of the green color.
     sta     $2122
     lda     #%00000000  ; Load the high byte of the green color.
     sta     $2122
     lda     #%00001111  ; End VBlank, setting brightness to 15 (100%).
     sta     $2100


	SetCursorPos 1,1
	
	lda #3
	ldy #0
	sta $0000, Y
	lda #2
	ldy #2
	sta $0000,Y
	;sta $00, Y

	ldy #0
	PrintString "Val: %d"	
	
	ldx #00
	stx $80
	lda #%0000			;Brilho $2100 0%
	sta $2100
	lda #00				;bool $82 = false
	sta $82


forever:
	wai	;wait for next frame

	;do whatever you feel like here	
	SetCursorPos 2,1
	lda $80
	inc A
	sta $80
	cmp #1
	bne Fin
	lda #00
	sta $80
	lda $2100
	cmp #%0000			;Min value brilho
	beq TestInc
	cmp #%1111			;Max value brilho
	beq TestDec
	lda $82
	cmp #$0
	beq Inc
	bra Dec
TestInc:
	lda #0
	sta $82	;seta variavel $82 = 1 significa q o brilho agora tem q decrementar
	bra Inc
TestDec
	lda #1
	sta $82	
	bra Dec
Inc:
	lda $2100
	inc A
	bra Next
Dec:
	lda $2100
	dec A
Next:
	sta $2100
Fin:
	
	;let's print the current frame number
	SetCursorPos 20, 10
	ldy #FrameNum
	PrintString "num = %d    "

	jmp forever

.ENDS

