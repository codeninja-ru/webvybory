#/bin/sh

if [[ "$#" != "2" ]] ; then
	echo "usage ./go cid uik"
	echo "cid - айдишник видео"
	echo "uik - номер уик, чтобы не проебать"
	exit 0
fi

# подставьте свой хост, чтобы не грузить всем один сервак
HOST="188-254-120-4.webvybory2012.ru"

CID="$1"
UIK="$2"

mkdir video

while [ true ]; do
	NOW=`date -u "+%Y%m%d_%H%M%S"`
	FILE="video/uik$UIK-$CID-$NOW.mpg"
	URL="http://$HOST/variant.m3u8?cid=$CID&var=orig" 
	ffmpeg -i $URL -f mpegts -vcodec copy -acodec copy $FILE
done

