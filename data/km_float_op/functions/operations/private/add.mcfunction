# x + y

# |x + y|
data merge storage km_float_op:_ {matrix:[1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]}

data modify storage km_float_op:_ matrix[0] set from storage km_float_op: input.x
data modify storage km_float_op:_ matrix[1] set from storage km_float_op: input.y
data modify storage km_float_op:_ matrix[4] set from storage km_float_op: input.y
data modify storage km_float_op:_ matrix[5] set from storage km_float_op: input.x

data modify entity @s transformation set from storage km_float_op:_ matrix
data modify storage km_float_op:_ transformation set from entity @s transformation

# 結果の正負の確認
data modify storage km_float_op:_ maybe_minus set string storage km_float_op:_ transformation.left_rotation[0] 0 1

# 正の場合
execute unless data storage km_float_op:_ {maybe_minus:"-"} run data modify storage km_float_op: output set from storage km_float_op:_ transformation.scale[0]

# 負の場合
execute if data storage km_float_op:_ {maybe_minus:"-"} run data merge storage km_float_op:_ {matrix:[1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f]}
execute if data storage km_float_op:_ {maybe_minus:"-"} run data modify storage km_float_op:_ matrix[3] set from storage km_float_op:_ transformation.scale[0]
execute if data storage km_float_op:_ {maybe_minus:"-"} run data modify entity @s transformation set from storage km_float_op:_ matrix
execute if data storage km_float_op:_ {maybe_minus:"-"} run data modify storage km_float_op: output set from entity @s transformation.translation[0]