# KMFloatOp
Minecraft JEのコマンドで浮動小数点数の演算を行うためのライブラリです

# できること
float数同士の四則演算

# 対応バージョン
Minecraft Java Edition 1.19.4~

# 使い方
```
ストレージに左辺(x)と右辺(y)の値を代入（値の後にfサフィックスをつけてfloat型を明示することを推奨）
data modify storage km_float_op: input.x set value 3.0f
data modify storage km_float_op: input.y set value 2.0f

加算処理実行
km_float_op:operations/add

減算処理実行
km_float_op:operations/sub

乗算処理実行
km_float_op:operations/mul

除算処理実行（プレイヤの位置などの読み込まれている座標で実行すること）
km_float_op:operations/div

実行後ストレージに結果が格納される
data get storage km_float_op: output
```

# 連絡先
不具合や要望などがあればTwitterまでご連絡ください
https://twitter.com/komaramune