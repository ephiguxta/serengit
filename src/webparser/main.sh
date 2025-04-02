URL="https://lists.nongnu.org/archive/html/shell-script-pt/"

gen_valid_dates() {
	local path="/tmp/index.html"

	if wget -q $URL -O $path; then

		# o regex é um lookaround para pegar o (.*) só se existir um
		# <li><b> antes e um </b> depois.
		#
		for data in $(grep -Po '(?<=(<li><b>))(.*)(?=(</b>))' $path); do
			echo $data
		done
	fi
}

gen_valid_dates
