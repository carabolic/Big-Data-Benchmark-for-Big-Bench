#!/usr/bin/env bash

query_run_main_method () {
	HIVE_SCRIPT="$QUERY_DIR/$QUERY_NAME.sql"
	if [ ! -r "$HIVE_SCRIPT" ]
	then
		echo "SQL file $HIVE_SCRIPT can not be read."
		exit 1
	fi

        hive $HIVE_PARAMS -i "$COMBINED_PARAMS_FILE" -f "$HIVE_SCRIPT"
}

query_run_clean_method () {
	hive $HIVE_PARAMS -i "$COMBINED_PARAMS_FILE" -e "DROP TABLE IF EXISTS $TEMP_TABLE; DROP TABLE IF EXISTS $RESULT_TABLE;"
}
