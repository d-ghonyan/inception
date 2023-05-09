for id in "$@"
do
	docker stop $(docker ps | grep "$id" | awk '{print $1}')
done
