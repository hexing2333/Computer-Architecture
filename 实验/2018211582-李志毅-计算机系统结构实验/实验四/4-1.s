.text
main:
ADDIU $r1, $r0, 15 #保存数组大小
ADDIU $r2, $r0, 14 #外循环计数 i
LOOP1: #外循环
ADDIU $r3, $r0, array #数组array
ADDIU $r4, $r0, 0 #内循环计数 j
LOOP2: #内循环
LW $r5, 0($r3) # array[j]
LW $r6, 4($r3) # array[j+1]
DSUB $r7, $r5, $r6 #array[j] - array[j+1]
BLTZ $r7, bk #若array[j] < array[j+1],则跳转到bk
SW $r6, 0($r3) #若array[j] > array[j+1],则交换位置
SW $r5, 4($r3)
bk:
ADDIU $r4, $r4, 1 #j=j+1
ADDIU $r3, $r3, 4 #下一个数
DSUB $r8, $r2, $r4 #i - j
BGTZ $r8, LOOP2 
ADDIU $r2, $r2, -1 #i=i-1
BGTZ $r2, LOOP1 #i > 0 继续外循环
TEQ $r0, $r0 #End
.data
array:
.word 7,34,8,22,28,49,25,44,35,14,11,4,42,3,2