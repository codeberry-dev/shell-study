#!/bin/sh
 
INPUT_FILE=./problem_fruitsAAAAA

## ファイルの存在チェック
if [ ! -f ${INPUT_FILE} ]; then
  echo "入力ファイルがありません"
  exit
fi

## ファイルの読み込みと出力
while read LINE; do
  echo ${LINE}
done < ${INPUT_FILE}
