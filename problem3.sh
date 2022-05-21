#!/bin/sh
 
INPUT_FILE=./problem_fruits
OUTPUT_FILE=./problem3_fruits_output

## ファイルの存在チェック
if [ ! -f ${INPUT_FILE} ]; then
  echo "入力ファイルがありません"
  exit
fi

## ファイル内の特定の文字列の排除を行いファイルに吐き出す
## 「fruits」で始まる行だけ抽出して「apple」を排除してファイルにして吐き出す。
## ヒント：「特定の文字だけ除外 シェルスクリプト」でぐぐるとやり方が見つかるかも、、、
## sed を利用して行の削除と置換を行アウトプットファイルに出す
sed -e '/^果物/d; s/ [aA][pP][pP][lL][eE]//g' ${INPUT_FILE} > ${OUTPUT_FILE}
