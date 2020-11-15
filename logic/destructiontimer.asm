;----------------------------------------------------------------------------
;
; Destruction countdown	logic
;
; Decrement the	timer
; Update the time on screen
; Kills	the player if the time ends.
;----------------------------------------------------------------------------

DecNukeTimer:
		    ld	    a, (+vars.DestructionTimerOn)
		    and	    a
		    ret	    z				    ; Self destruction not enabled

		    ld	    hl,	+vars.DestructTimer
		    ld	    a, (hl)
		    sub	    1
		    daa
		    ld	    (hl), a			    ; Decrement	units and tens
		    jr	    nc,	DecNukeTimer2

		    inc	    hl
		    ld	    a, (hl)
		    sub	    1
		    daa
		    ld	    (hl), a			    ; Decrement	hundreds and thousands
		    dec	    hl

DecNukeTimer2:
		    ld	    a, (hl)			    ; Units and	tens
		    inc	    hl
		    or	    (hl)			    ; Hundreds and thousands
		    ret	    nz				    ; The timer	is not 0

		    call    DrawCallTimer		    ; Update counter on	screen

		    xor	    a
		    ld	    (+vars.Life), a			    ; Empty energy bar
		    jp	    SetDead			    ; Set dead mode
