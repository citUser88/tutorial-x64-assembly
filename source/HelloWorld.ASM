; =====================================================================================
; HelloWorld.ASM - small Hello World application
; =====================================================================================

; semicolons indicate comments at beginning of line or directly after 
;   code/data declarations

; Intel and AMD x86 x64 architectures use little-endian storage format in memory
; and with their (ISA) Instruction set architectures

; (Application Programming Interface) API function prototypes 
;   to make these 2 functions located in user32.lib/kernel32.lib 'available' later 
;   on in the assembly file to be able to be called
;   during program execution using the call instruction
;   similar to extern in C code or _declspec
; =====================================================================================
extrn ExitProcess: PROC
extrn MessageBoxA: PROC
; -------------------------------------------------------------------------------------
         
; Object libraries
; =====================================================================================
includelib user32.lib       ; for MessageBoxA
includelib kernel32.lib     ; for ExitProcess
; -------------------------------------------------------------------------------------
  
; .data indicates the area where most of the user-defined data exists
; =====================================================================================
.data
    ; null(zero) terminated -> ASCIIZ strings
    ; db -> define byte granularity of data
    ; 8-bit ASCII codes, or UTF-8 escapes if enabled
    sTitle      db "Tutorial - 01",0    ; Title for the message box
    sMessage    db "Hello World!",0     ; Message to display in the message box
; -------------------------------------------------------------------------------------
;   SOME EXAMPLES of defining data

    exOneByte   db 5; Defines exOneByte which points to memory location decimal value 5
    
;   Note: required: 0-prefix with suffix 'h', indicates a hex value

    exHiByte    db 0FFh   ; Defines 255 decimal, all 8 bits are Ones
    exWord      dw 0FFFFh ; defines a word (2 bytes), value 65535 decimal
    exDubWord   dd 01010Fh ; defines a double word (4 bytes), value 00001010h
    exQuad      dq 0h   ;   defines a quad word (reserves 8 bytes filled with 0h)
;
; .code execution space where the programmer's hand-written assembly code lives
; =====================================================================================
.code 

; Entrance point HAS to be WinMainCRTStartup for this code to run 
; Linking with /subsystem:windows is where this is decided
; This indicates the starting PROCEDURE CALL, where your program's execution begins
WinMainCRTStartup PROC
    ; FIRST INSTRUCTION of this file is AFTER these comments
    ;--------------------------------------------------------------------------
    ; subtract bit sequence 28h (hexadecimal) 40, from rsp
    ; rsp is the 64-bit stack register that points to the current location offset
    ; of the stack memory space stack grows backwards and is a 
    ; LIFO (last in first out) queue
                        ; (2 x 10h = 16 each = 32, + 8 = 40 decimal)
                        ; 0010 1000 - what 28h looks like as binary                     
    ; 1st instruction
    sub     rsp,28h         ; shadow space/spill space/home space, aligns/grows stack
                            ; enhances ease of debugging for unoptimized code
                            ; by allowing a shadow copy of registers etc to be 
                            ; dumped somewhere WHEN your program crashes :)
                            ; not required, only for protection of 1's future sanity 

    ;--------------------------------------------------------------------------
    ; Preparing to call the windows API functions stored in xxxx32.lib
    ; registers with r prefix are 64-bit registers  (8 bytes) 
    ;                                               (4 words)         
    ;                                               (2 doublewords)
    ;                                               (1 quadword)    
    ; the r9d register has a suffix of d - meaning access the 
    ;   lower 32-bit doubleword portion of the 64-bit r9 GPR reg                                   
    ; rcx = 0 is the hWnd handle for the desktop handle HWND_DESKTOP
    ; rdx = store address of +0 offset of sMessage (start of ASCIIZ string) in rdx
    ; r8  = store address of +0 offset of sTitle   (start of ASCIIZ string) in r8
    ; r9d = store 0 into the lower/least 32-bit (least significant) portion
    ;       of the 64-bit r9 register                   
    mov     rcx,0           ; hWnd = HWND_DESKTOP = 0
    
    ; FOR demonstration purposes same result as mov rcx,0
    xor     rcx,rcx         ; similarly exclusive or a register with itself 
                            ; also breaks-sets all the bits to low or 0
                            ; xor was/is still? faster IIRC
                            
    ; NOTE - many, most instructions alter some of the (e)Flags GPR bits following
    ;           completion

    ; load effective address -> LEA stores the address of the +0 offset in memory of 
    ;   address pointed to by sMessage
    ; fast-call calling convention
    lea     rdx,sMessage    ; LPCSTR lpText -> LPCSTR windows jargon for
                            ;   long pointer to C string (ASCIIZ string)
    lea     r8,sTitle       ; LPCSTR lpCaption - same as last instruction, different
                            ;   register (r8 -> 64-bit GPR), memory location referenced
                            ;   to by sTitle label, which is the ASCII-Z title string
    mov     r9d,0           ; uType = 0 = MB_OK, store this value in the 
                            ;   lower 32-bits of the 64-bit r9 general purpose register 
                            ;   This is the type of message box MB_OK see MSDN
    
    ; Windows API function which displays a message box.
    ; the A is for ASCII or alphanumeric
    ; Another function MessageBoxW uses the wide char (16-bit for internationalization)
    ; will bother with Wide char format in near future, absolutely, it is important 
    ; to know some base case knowledge about unicode, utf-8-16, asciiz, UCS, etc....
    call    MessageBoxA     ; execute a call to MessageBoxA
    ; Return code of call is stored in the (GPR) general purpose 32-bit register eax
    mov     ecx,eax         ; copy contents of eax into the 32-bit GPR ecx, thus
                            ; setting parameter 1 of the call to ExitProcess
                        
    call    ExitProcess     ; call the windows api function to cleanly exit the program
                            ; this is windows... afterall
                            ; windows uses a 'calling convention', discussed outside of
                            ; this file

WinMainCRTStartup ENDP  ; end of WinMainCRTStartup procedure
End     ; This is the END...  indication of the end of the assembly file

;--------------------------------------------------------------------------------------
; --- |  | /--                     /--\ /-\ |\/|                         /-- |\ |  |--\
;  |  |--| |-                      |__| `-, |  |                         |-  | \|  |  |
;  |  |  | \--                     |  | \_/ |  |                         \-- |  |  |__/
;--------------------------------------------------------------------------------------
