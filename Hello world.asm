* = $C000
text = $C100
screenRam = $0400

:clr
          lda  #$93  ;load the petscii value for clear screen
          jsr  $ffd2 ;print to screen
          ldx  #00  ;reset the X register

:print_text

          lda  text, x ;load letter of Message 
          cmp  #00     ;Check for last byte
          beq  end     ;end the program if it was the last byte
          sta  screenRam, x     ;store the value in Screen Ram     
          inx  ;move to next letter of message
          jmp  print_text ;loop for next letter

:end 
          rts ;return to basic

* = $C100

          !Scr  "hello, world." 
          !byte  $00


          
          