#!/usr/bin/env bash

#
# adds mapping, which have been not existing in the first versions
#

curl -XPUT 'localhost:9200/ews2017.1/_mapping/CVE?pretty' -H 'Content-Type: application/json' -d'
{
  "properties": {
 						"firstSeen": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "lastSeen": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "firstIp": {
                        "type": "ip"
                    },
                    "number": {
                        "type": "text"
                    }
  }
}
'

curl -XPUT 'localhost:9200/ews2017.1/_mapping/Alert?pretty' -H 'Content-Type: application/json' -d'
{
  "properties": {

                    "recievedTime": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "createTime": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "createTime": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "recievedTime": {
                        "type": "date",
                        "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
                    },
                    "sourceEntryIp": {
                        "type": "ip"
                    },
                    "targetEntryIp": {
                        "type": "ip"
                    },
                    "clientDomain": {
                        "type": "boolean"
                    }
  }
}
'