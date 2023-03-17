# x + y

data merge storage km_formula:_ {matrix:[1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]}

data modify storage km_formula:_ matrix[0] set from storage km_formula: x
data modify storage km_formula:_ matrix[1] set from storage km_formula: y
data modify storage km_formula:_ matrix[4] set from storage km_formula: y
data modify storage km_formula:_ matrix[5] set from storage km_formula: x

data modify entity 53a-0-0-0-0 transformation set from storage km_formula:_ matrix
data modify storage km_formula:_ transformation set from entity 53a-0-0-0-0 transformation

# 結果の正負の確認
data modify storage km_formula:_ maybe_minus set string storage km_formula:_ transformation.left_rotation[0] 0 1

# 正の場合
execute unless data storage km_formula:_ {maybe_minus:"-"} run data modify storage km_formula: result set from storage km_formula:_ transformation.scale[0]

# 負の場合
execute if data storage km_formula:_ {maybe_minus:"-"} run data merge storage km_formula:_ {matrix:[1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f]}
execute if data storage km_formula:_ {maybe_minus:"-"} run data modify storage km_formula:_ matrix[3] set from storage km_formula:_ transformation.scale[0]
execute if data storage km_formula:_ {maybe_minus:"-"} run data modify entity 53a-0-0-0-0 transformation set from storage km_formula:_ matrix
execute if data storage km_formula:_ {maybe_minus:"-"} run data modify storage km_formula: result set from entity 53a-0-0-0-0 transformation.translation[0]