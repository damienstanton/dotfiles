source ~/zsh/secret.sh

# connect to 'dev' environment for ACT backend
act_db() {
	db=""
	for k in "${(@k)ACT_DATABASES}"; do
		if [ $1 = $k ]; then
			echo "setting db to: ${ACT_DATABASES[$k]}"
			db="${ACT_DATABASES[$k]}"
		else
			continue
		fi
	done
	if [ $db = "" ]; then
		echo "No DB match"
		return 1
	else
		echo "Connecting to $db now..."
		mssql -s $ACT_HS -u $ACT_US -p $ACT_PW -d $db -e
	fi
}

# simplify codesync for ionic
mrun() {
	case $1 in
		ios) npx cap sync && npx cap open ios ;;
		android) npx cap sync && npx cap open android ;;
		*) echo "target not specified. Need one of [ios, android]" ;;
	esac
}
