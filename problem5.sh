#!/bin/sh

## 5. problem5ディレクトリを再起的に参照し、日付の古いファイルを削除するスクリプトを作成してください。削除対象は半年（6ヶ月）以前とします。

TARGET_DIR=./problem5
DELETE_DAY=`date -d "$(date +'%Y%m%d') 6 month ago" +'%Y%m%d'`
dirs=`find $TARGET_DIR -type f`

for dir in $dirs;
do
   # YYYYMMDDのファイル名に対して削除を行う
   if [[ ${dir} =~ 202[0-9]{5} ]]
   then

    # ファイル名から日付部分を取り出す
    FILE_DATE=`expr "${dir}" : ".*\(202[0-9]\{5\}\)"`

    # 日付の大小比較（削除対象日以前の場合はファイルを削除する）
    if [ ${FILE_DATE} -lt ${DELETE_DAY} ]
    then
     rm ${dir}
    fi
   fi
done
