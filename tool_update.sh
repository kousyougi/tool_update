#!/bin/sh

mkdir /tmp/tool_update

file_name="Xray-linux-64"

	wget --quiet "https://github.com/XTLS/Xray-core/releases/latest/download/${file_name}.zip.dgst" -O "/tmp/tool_update/${file_name}.zip.dgst"
	new_md5sum=$( cat "/tmp/tool_update/${file_name}.zip.dgst" | grep '^MD5=' | awk '{print $2}' )
	
	wget --quiet "https://github.com/XTLS/Xray-core/releases/latest/download/${file_name}.zip" -O "/tmp/tool_update/${file_name}.zip"
	new_downloaded_md5sum=$( md5sum "/tmp/tool_update/${file_name}.zip" | awk '{print $1}' )
	if [ "$new_md5sum" = "$new_downloaded_md5sum" ]; then
		unzip -o "/tmp/tool_update/${file_name}.zip" -d /tmp/tool_update
		md5sum /tmp/tool_update/xray | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip /tmp/tool_update/xray
		mv /tmp/tool_update/xray.gz "upload/${file_name}.gz"
		echo $new_md5sum > "upload/${file_name}.zip.md5sum"
	fi

file_name="Xray-linux-arm64-v8a"


	wget --quiet "https://github.com/XTLS/Xray-core/releases/latest/download/${file_name}.zip.dgst" -O "/tmp/tool_update/${file_name}.zip.dgst"
	new_md5sum=$( cat "/tmp/tool_update/${file_name}.zip.dgst" | grep '^MD5=' | awk '{print $2}' )
	
	wget --quiet "https://github.com/XTLS/Xray-core/releases/latest/download/${file_name}.zip" -O "/tmp/tool_update/${file_name}.zip"
	new_downloaded_md5sum=$( md5sum "/tmp/tool_update/${file_name}.zip" | awk '{print $1}' )
	if [ "$new_md5sum" = "$new_downloaded_md5sum" ]; then
		unzip -o "/tmp/tool_update/${file_name}.zip" -d /tmp/tool_update
		md5sum /tmp/tool_update/xray | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip /tmp/tool_update/xray
		mv /tmp/tool_update/xray.gz "upload/${file_name}.gz"
		echo $new_md5sum > "upload/${file_name}.zip.md5sum"
	fi



hysteria_sha256=$( curl --silent -L "https://github.com/apernet/hysteria/releases/latest/download/hashes.txt" )



file_name="hysteria-linux-amd64"

	new_sha256sum=$( echo "$hysteria_sha256" | grep "$file_name$" | awk '{print $1}' )

	wget --quiet "https://github.com/apernet/hysteria/releases/latest/download/${file_name}" -O "/tmp/tool_update/${file_name}"
	new_downloaded_sha256sum=$( sha256sum "/tmp/tool_update/${file_name}" | awk '{print $1}' )
	if [ "$new_sha256sum" = "$new_downloaded_sha256sum" ]; then
		md5sum "/tmp/tool_update/${file_name}" | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip "/tmp/tool_update/${file_name}"
		mv "/tmp/tool_update/${file_name}.gz" upload/
		echo $new_sha256sum > "upload/${file_name}.sha256sum"
	fi


file_name="hysteria-linux-amd64-avx"


	new_sha256sum=$( echo "$hysteria_sha256" | grep "$file_name$" | awk '{print $1}' )

	wget --quiet "https://github.com/apernet/hysteria/releases/latest/download/${file_name}" -O "/tmp/tool_update/${file_name}"
	new_downloaded_sha256sum=$( sha256sum "/tmp/tool_update/${file_name}" | awk '{print $1}' )
	if [ "$new_sha256sum" = "$new_downloaded_sha256sum" ]; then
		md5sum "/tmp/tool_update/${file_name}" | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip "/tmp/tool_update/${file_name}"
		mv "/tmp/tool_update/${file_name}.gz" upload/
		echo $new_sha256sum > "upload/${file_name}.sha256sum"
	fi

file_name="hysteria-linux-arm64"


	new_sha256sum=$( echo "$hysteria_sha256" | grep "$file_name$" | awk '{print $1}' )

	wget --quiet "https://github.com/apernet/hysteria/releases/latest/download/${file_name}" -O "/tmp/tool_update/${file_name}"
	new_downloaded_sha256sum=$( sha256sum "/tmp/tool_update/${file_name}" | awk '{print $1}' )
	if [ "$new_sha256sum" = "$new_downloaded_sha256sum" ]; then
		md5sum "/tmp/tool_update/${file_name}" | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip "/tmp/tool_update/${file_name}"
		mv "/tmp/tool_update/${file_name}.gz" upload/
		echo $new_sha256sum > "upload/${file_name}.sha256sum"
	fi



tag_ver=$( curl -s https://api.github.com/repos/hacdias/webdav/releases/latest | grep '"tag_name"' | cut -d '"' -f 4 | cut -c2- )
webdav_sha256=$( curl --silent -L "https://github.com/hacdias/webdav/releases/latest/download/webdav_${tag_ver}_checksums.txt" )



file_name="linux-amd64-webdav"

	new_sha256sum=$( echo "$webdav_sha256" | grep "${file_name}.tar.gz$" | awk '{print $1}' )

	wget --quiet "https://github.com/hacdias/webdav/releases/latest/download/${file_name}.tar.gz" -O "/tmp/tool_update/${file_name}.tar.gz"
	new_downloaded_sha256sum=$( sha256sum "/tmp/tool_update/${file_name}.tar.gz" | awk '{print $1}' )
	if [ "$new_sha256sum" = "$new_downloaded_sha256sum" ]; then
		tar -zxvf "/tmp/tool_update/${file_name}.tar.gz" -C /tmp/tool_update/
		md5sum "/tmp/tool_update/webdav" | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip "/tmp/tool_update/webdav"
		mv /tmp/tool_update/webdav.gz "upload/${file_name}.gz"
		echo $new_sha256sum > "upload/${file_name}.sha256sum"
	fi

file_name="linux-arm64-webdav"

	new_sha256sum=$( echo "$webdav_sha256" | grep "${file_name}.tar.gz$" | awk '{print $1}' )

	wget --quiet "https://github.com/hacdias/webdav/releases/latest/download/${file_name}.tar.gz" -O "/tmp/tool_update/${file_name}.tar.gz"
	new_downloaded_sha256sum=$( sha256sum "/tmp/tool_update/${file_name}.tar.gz" | awk '{print $1}' )
	if [ "$new_sha256sum" = "$new_downloaded_sha256sum" ]; then
		tar -zxvf "/tmp/tool_update/${file_name}.tar.gz" -C /tmp/tool_update/
		md5sum "/tmp/tool_update/webdav" | awk '{print $1}' > "upload/${file_name}.md5sum"
		gzip "/tmp/tool_update/webdav"
		mv /tmp/tool_update/webdav.gz "upload/${file_name}.gz"
		echo $new_sha256sum > "upload/${file_name}.sha256sum"
	fi

rm -rf mkdir /tmp/tool_update
