#!/usr/bin/env bash

curl -X POST --header "Content-Type:text/xml;charset=UTF-8" -d @./alarmht.xml http://127.0.0.1:8080/ews-0.1/alert/postSimpleMessage

