#!/bin/bash
header_files=(
    "GCDWebServer.h:Core"
    "GCDWebServerConnection.h:Core"
    "GCDWebServerFunctions.h:Core"
    "GCDWebServerHTTPStatusCodes.h:Core"
    "GCDWebServerResponse.h:Core"
    "GCDWebServerRequest.h:Core"
    "GCDWebServerDataRequest.h:Requests"
    "GCDWebServerFileRequest.h:Requests"
    "GCDWebServerMultiPartFormRequest.h:Requests"
    "GCDWebServerURLEncodedFormRequest.h:Requests"
    "GCDWebServerDataResponse.h:Responses"
    "GCDWebServerErrorResponse.h:Responses"
    "GCDWebServerFileResponse.h:Responses"
    "GCDWebServerStreamedResponse.h:Responses"
    "GCDWebUploader.h:GCDWebUploader"
    "GCDWebDAVServer.h:GCDWebDAVServer"
)

for item in "${header_files[@]}"
do
    header_file="${item%%:*}"
    section="${item#*:}"
    source_file="../$section/$header_file"
    target_file="$header_file"
    ln -s "$source_file" "$target_file"
    echo "Created symbolic link: $target_file -> $source_file"
done
