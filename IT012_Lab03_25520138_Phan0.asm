#Mai Gia Bao - 25520138 - Phan 0 - Lam quen voi MARS

.data
msg:   .asciiz "Xin chao, MARS!\n"
 
.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 10
    syscall
