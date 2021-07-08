.text
main: 
ADDIU $r1,$r0,array1 #array1段地址
ADDIU $r2,$r0,array2 #array2段地址
ADDIU $r3,$r0,10     #向量长度10
ADDIU $r4,$r0,0      #保存最终结果
loop: 
LW $r5,0($r1) 
LW $r6,0($r2)
ADDI $r1,$r1,4 #优化点1
ADDI $r2,$r2,4 #优化点2
MUL $r7,$r5,$r6 #相乘
ADDI $r3,$r3,-1 #优化点3 
ADD $r4,$r4,$r7   #r4存放的是点积结果
BGTZ $r3,loop #循环判断
TEQ $r0,$r0

.data 
array1: .word 1,2,3,4,5,6,7,8,9 
array2: .word 1,2,3,4,5,6,7,8,9
