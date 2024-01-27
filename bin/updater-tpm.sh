#!/bin/sh
printf "<pre>\n"
printf "TPM Updater 1.0\n"
SCRIPT=$(realpath $0)
base_dir=$(dirname $SCRIPT)
update_dir="$base_dir/update"
if [ -f /tmp/update.zip ]; then
	mv /tmp/update.zip $update_dir
fi
printf "Extracting...\n"
cd "$update_dir"
for fz in *.zip; do
		[ -f "$fz" ] || continue
		unzip "$fz"
		rm -f "$fz"
done
for ftar in *.tar.*; do
		[ -f "$ftar" ] || continue
		tar xf "$ftar"
		rm -f "$ftar"
done
printf "Updating files...\n"
for fo in *; do
		printf "$fo..."
		ext="${fo##*.}"
		if [ "$ext" = "sh" ]; then
	    chmod u+x "$fo"
		fi
		existing=""
		if [ -f "$base_dir/$fo" ]; then
	    existing="$base_dir"
		else
      printf "ignored\n"
		fi
		if [ $existing ]; then
      if cmp -s "$fo" "$existing/$fo"; then
			  rm -f "$fo"
			  printf "=\n"
	    else
			  mv -f "$fo" "$existing/$fo"
			  printf "OK\n"
	    fi
		fi
done

printf "</pre>\n"
