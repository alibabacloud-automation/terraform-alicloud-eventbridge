bus_description        = "bus_description"
source_description     = "source_description"
linked_external_source = false
external_source_type   = "MNS"
rule_description       = "rule_description"
rule_filter_pattern    = "{\"source\":[\"acs.ecs\"],\"type\":[\"ecs:Snapshot:CreateSnapshotCompleted\"]}"
rule_status            = "DISABLE"
target_endpoint        = "acs:mns:cn-beijing:123456xxxx:queues/tf-test"
target_type            = "acs.mns.queue"

