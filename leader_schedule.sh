#adjust diff based on the difference between your time zone and your node's time zone, if needed; use 00:00 if there's no difference

diff="-01:00"
REST_PORT=3100

./jcli rest v0 leaders logs get -h http://127.0.0.1:${REST_PORT}/api | grep scheduled_at_time | cut -d' ' -f 4 | sed "s/+00:00/$diff/" | sed  "s/\"//g" |

while read p; do
        date -d $p +"%D %T"
done | sort | sed "s/CET//"
