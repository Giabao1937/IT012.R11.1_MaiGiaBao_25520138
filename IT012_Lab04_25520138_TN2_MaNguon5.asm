# Mai Gia Bao - 25520138 - Nhap dien nang tieu thu va phan loai bac gia dien
# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"
 
.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  # >>> xac dinh bac (1..4) theo Bang 6, dat vao $s1
  # >>> in “Bac: “, roi $s1, roi xuong dong
  slti $t0, $s0, 101     
  bne  $t0, $zero, Bac1
  slti $t0, $s0, 151     
  bne  $t0, $zero, Bac2
  slti $t0, $s0, 201     
  bne  $t0, $zero, Bac3
  # Neu >= 201 -> Bac 4
  addi $s1, $zero, 4
  j    InKetQua
  Bac1:
  addi $s1, $zero, 1
  j    InKetQua
Bac2:
  addi $s1, $zero, 2
  j    InKetQua
Bac3:
  addi $s1, $zero, 3
InKetQua:
  li   $v0, 4
  la   $a0, msg
  syscall
  li   $v0, 1
  add  $a0, $s1, $zero
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall
  li  $v0, 10
  syscall
