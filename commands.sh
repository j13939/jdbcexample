set -x


setOutput()
{
    if [ $# -ne 2 ]
    then
        echo "Key and value required on setOutput function call"
        exit 1
    fi
    echo "${2}" > "/u01/flexdeploy/application/localhost/work/91798633/9423469/internal/outputs/${1}"
}


ignoreStatus()
{
    setOutput FILE_PROCESSING_STATUS ENDPOINT_SKIPPED
}

setObjectResultStatusSuccess()
{
    setOutput FILE_PROCESSING_STATUS SUCCESS
}

setObjectResultStatusFailed()
{
    setOutput FILE_PROCESSING_STATUS FAILED
}

setObjectResultStatusSkipped()
{
    setOutput FILE_PROCESSING_STATUS SKIPPED
}

setObjectResultStatusNotAttempted()
{
    setOutput FILE_PROCESSING_STATUS NOT_ATTEMPTED
}

setObjectResultStatusIgnore()
{
    setOutput FILE_PROCESSING_STATUS ENDPOINT_SKIPPED
}


if [ $OBJECT_TYPE_CODE = 'AOL' ]
then
cp $FD_TRANSFER_DIR/*.ldt $FD_TEMP_DIR/EBSCustomizations/XXHR/import/US
fi

if [ $OBJECT_TYPE_CODE = 'OAF_MDS' ]
then
cp -R $FD_TRANSFER_DIR/* $FD_TEMP_DIR/gitrepo/EBS/mds
fi

if [ $OBJECT_TYPE_CODE = 'WEB_ADI' ]
then
cp $FD_TRANSFER_DIR/*.ldt $FD_TEMP_DIR/gitrepo/EBS/webadi
fi

if [ $OBJECT_TYPE_CODE = 'WORKFLOW_DEFINITION' ]
then
cp $FD_TRANSFER_DIR/*.wft $FD_TEMP_DIR/gitrepo/EBS/workflow/US
fi
