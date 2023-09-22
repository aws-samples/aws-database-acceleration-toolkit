{
    "widgets": [
        {
            "type": "metric",
            "height": 6,
            "width": 6,
            "y": 6,
            "x": 0,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "DatabaseConnections", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "title": "Database Connections",
                "region": "${region}",
                "annotations": {
                    "horizontal": [
                        {
                            "label": "Max",
                            "value": ${database_max_connections_warning}
                        }
                    ]
                }
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "CPUUtilization", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "CPUUtilization",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "ReplicaLag", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}" } ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "ReplicaLag",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 12,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "FreeableMemory", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}" } ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "FreeableMemory",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "WriteIOPS", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "WriteIOPS",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "WriteLatency", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}" } ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "WriteLatency",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "ReadLatency", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "ReadLatency",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "ReadIOPS", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "ReadIOPS",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "WriteThroughput", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "WriteThroughput",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 12,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "AWS/RDS", "NetworkThroughput", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "NetworkThroughput",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 12,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "ActiveSessionsCount", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "ActiveSessionsCount",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 12,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "IdleSessionsCount", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "IdleSessionsCount",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "IdleInTransactionSessionsCount", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "IdleInTransactionSessionsCount",
                "region": "${region}"
            }
        },        
        {
            "type": "metric",
            "x": 6,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "NumOfLongRunningQueries2Min", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "NumOfLongRunningQueries2Min",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "NumOfLongRunningQueries5Min", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "NumOfLongRunningQueries5Min",
                "region": "${region}"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    %{ for identifier in database_identifiers ~}
                    [ "PG Performance Metrics", "NumOfLongRunningQueries10Min", "DBClusterIdentifier", "${identifier}", { "stat": "Average", "id": "m${index(database_identifiers, identifier)}"} ]%{if index(database_identifiers, identifier) != length(database_identifiers) - 1},%{endif}
                    %{ endfor ~}
                ],
                "legend": {
                    "position": "bottom"
                },
                "period": 60,
                "view": "timeSeries",
                "stacked": false,
                "start": "-PT3H",
                "end": "P0D",
                "title": "NumOfLongRunningQueries10Min",
                "region": "${region}"
            }
        }
    ]
}
