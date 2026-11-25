# Mai Gia Bao - 25520138 - Tinh dien nang tieu thu tung thang, luu vao mang usage va in ra man hinh
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
  addi $s4, $zero, 0    # $s4 = tong dien nang = 0
  addi $s5, $zero, 0    # $s5 = dien nang cao nhat = 0
  addi $s6, $zero, 0    # $s6 = thang cao nhat = 0
Loop:
  # >>> thoat neu i == n
  beq  $s2, $s3, Done
  # >>> tinh dia chi reading[i]
  sll  $t1, $s2, 2      # $t1 = 4 * i (do doi theo byte)
  add  $t2, $s0, $t1
  # >>> $t3 = reading[i], $t4 = reading[i+1]
  lw   $t3, 0($t2)
  lw   $t4, 4($t2)
  # >>> $t5 = $t4 - $t3 (dien nang thang i+1)
  sub  $t5, $t4, $t3
  # >>> tinh dia chi usage[i], luu $t5 vao usage[i]
  add  $t6, $s1, $t1  
  sw   $t5, 0($t6)
  add  $s4, $s4, $t5        # cong don dien nang vao $s4
  slt  $t7, $s5, $t5        # neu $s5 < $t5 thi $t7 = 1
  beq  $t7, $zero, SkipMax  # neu khong lon hon thi bo qua
  add  $s5, $t5, $zero      # cap nhat dien nang lon nhat ($s5)
  addi $s6, $s2, 1          # cap nhat thang tuong ung ($s6 = i + 1)
SkipMax:
  # >>> in “Thang “, i+1, “: ", $t5, xuong dong
  li   $v0, 4
  la   $a0, m1
  syscall

  li   $v0, 1
  addi $a0, $s2, 1      # thang = i + 1
  syscall

  li   $v0, 4
  la   $a0, m2
  syscall

  li   $v0, 1
  add  $a0, $t5, $zero
  syscall

  li   $v0, 4
  la   $a0, nl
  syscall
  # >>> i = i + 1, quay lai Loop
  addi $s2, $s2, 1  
  j    Loop
Done:
# In "Tong: <tong>"
  li   $v0, 4
  la   $a0, mt
  syscall
  li   $v0, 1
  add  $a0, $s4, $zero
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall
  # In "Thang cao nhat: <thang> (<dien nang>)"
  li   $v0, 4
  la   $a0, mm
  syscall
  li   $v0, 1
  add  $a0, $s6, $zero
  syscall
  li   $v0, 4
  la   $a0, lp
  syscall
  li   $v0, 1
  add  $a0, $s5, $zero
  syscall
  li   $v0, 4
  la   $a0, rp
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall
  
  li   $v0, 10
  syscall
