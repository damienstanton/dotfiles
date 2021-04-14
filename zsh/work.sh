# simplify codesync for ionic
mrun() {
	case $1 in
		ios) npx cap sync && npx cap open ios ;;
		android) npx cap sync && npx cap open android ;;
		*) echo "target not specified. Need one of [ios, android]" ;;
	esac
}
