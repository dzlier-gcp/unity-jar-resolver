#!/bin/bash

# Fail on any error.
set -e
# Display commands being run.
set -x

# If UNITY_USERNAME and UNITY_PASSWORD are not defined, get the default
# Google unity publisher account info from gresourcefile.
if [[ -z "$UNITY_USERNAME" ] || [ -z "$UNITY_PASSWORD" ]]
    source "${KOKORO_GFILE_DIR}/bigtable_secrets.txt"
fi

echo "Updating Unity package with ID [$UNITY_PACKAGE_ID] at path [$UNITY_PACKAGE_PATH]"

# Runs the Unity Asset Uploader upload_package target.
cd ${KOKORO_ARTIFACTS_DIR}/git/unity-jar-resolver
python3 ./source/UnityAssetUploader/unity_asset_uploader.py upload_package

set +e
set +x
