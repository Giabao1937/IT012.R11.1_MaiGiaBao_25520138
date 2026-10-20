#Mai Gia Bao - 25520138 - TN3 - 3.2 - Ma nguon 6 - dien nang tieu thu giua hai chi so

.data
prompt1: .asciiz "Nhap chi so cu (kWh): "
prompt2: .asciiz "Nhap chi so moi (kWh): "
label:   .asciiz "Dien nang (kWh): "
newline: .asciiz "\n"
 
.text
.globl main
main:
    # --- doc chi so cu vao $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5              # dich vu 5: doc so nguyen, ket qua o $v0
    syscall
    add  $s0, $v0, $zero     # giu gia tri trong $s0
 
    # >>> doc chi so moi vao $s1 (in prompt2, roi dich vu 5)
    li   $v0, 4              # In chuoi prompt2
    la   $a0, prompt2
    syscall
    li   $v0, 5              # Doc so nguyen
    syscall
    add  $s1, $v0, $zero     # Giu gia tri trong $s1
    # >>> usage = current - previous, vao $t0
    sub  $t0, $s1, $s0
    # >>> in label, roi usage (dich vu 1), roi newline
    li   $v0, 4              # In label
    la   $a0, label
    syscall
    li   $v0, 1              # In so nguyen usage
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4              # In newline
    la   $a0, newline
    syscall
    #Ket thuc chuong trinh
    li   $v0, 10
    syscall
