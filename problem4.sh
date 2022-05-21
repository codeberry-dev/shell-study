#!/bin/sh
 
INPUT_FILE=./problem_fruits
OUTPUT_FILE=./problem4_fruits_output

## 4. INPUTファイルの２列目以降のapple、orange、grape、melon を集計した結果をOUTPUTファイルに出力してください。
## 4_1 Appleを集計
# cat ${INPUT_FILE} | awk '{count += (split($0, a, "apple") - 1)} END{printf("apple:%d ", count)}' > ${OUTPUT_FILE}

## 4_2 ファイル内の集計
## 以下に記述

## 4_3 行ごとに集計
# cat ${INPUT_FILE} |
#    awk '{for(i=2;i<=NF;i++){count[$i]++};for(j in count){printf("%s:%d ",j,count[j]);count[j]=0}print ""}' > ${OUTPUT_FILE}


#############################
## ファイルの存在チェック
if [ ! -f ${INPUT_FILE} ]; then
  echo "入力ファイルがありません"
  exit
fi

## ファイルの読み込みと出力
appleCount=0
orangeCount=0
grapeCount=0
melonCount=0

while read LINE; do
  ARR=(${LINE// / })
  for fruits in "${ARR[@]}"; do
      if [ "$fruits" = "apple" ]; then
        appleCount=$((++appleCount))
      fi
      if [ "$fruits" = "orange" ]; then
        appleCount=$((++orangeCount))
      fi
      if [ "$fruits" = "grape" ]; then
        appleCount=$((++grapeCount))
      fi
      if [ "$fruits" = "melon" ]; then
        appleCount=$((++melonCount))
      fi
  done
done < ${INPUT_FILE}


for fruits in apple orange melon grape; do
  result=0
  if [ "$fruits" = "apple" ]; then
    result="$appleCount"
  fi
  if [ "$fruits" = "orange" ]; then
    result="$orangeCount"
  fi
  if [ "$fruits" = "grape" ]; then
    result="$grapeCount"
  fi
  if [ "$fruits" = "melon" ]; then
    result="$melonCount"
  fi
  echo "$fruits: ${result}"
done > ${OUTPUT_FILE}
