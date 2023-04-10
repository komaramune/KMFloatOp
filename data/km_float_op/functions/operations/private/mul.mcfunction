# x * y

data merge storage km_float_op:_ {matrix:[1f,0f,0f,1f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]}

# 1 / y
data modify storage km_float_op:_ matrix[15] set from storage km_float_op: input.y
data modify entity @s transformation set from storage km_float_op:_ matrix

# x / (1 / y)
data modify storage km_float_op:_ matrix[3] set from storage km_float_op: input.x
data modify storage km_float_op:_ matrix[15] set from entity @s transformation.translation[0]

data modify entity @s transformation set from storage km_float_op:_ matrix

data modify storage km_float_op: output set from entity @s transformation.translation[0]