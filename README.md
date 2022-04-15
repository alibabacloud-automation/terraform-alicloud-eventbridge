Terraform Module for creating EventBridge resources on Alibaba Cloud.

terraform-alicloud-eventbridge
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create a EventBridge resources under Alibaba Cloud.

These types of resources are supported:

* [alicloud_event_bridge_event_bus](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_event_bus)
* [alicloud_event_bridge_event_source](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_event_source)
* [alicloud_event_bridge_rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_rule)
* [alicloud_event_bridge_service_linked_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_service_linked_role)

## Usage

```hcl
module "example" {
  source                 = "terraform-alicloud-modules/eventbridge/alicloud"
  #alicloud_event_bridge_event_bus
  create_bus             = true
  event_bus_name         = "tf-name"
  #alicloud_event_bridge_event_source
  create_source          = true
  event_source_name      = "tftest"
  linked_external_source = false
  external_source_type   = "MNS"
  external_source_config = {
    QueueName = module.mns-queue.queue_name
  }
  #alicloud_event_bridge_rule
  create_rule            = true
  rule_name              = "tf-name"
  rule_filter_pattern    = "{\"source\":[\"acs.ecs\"],\"type\":[\"ecs:Snapshot:CreateSnapshotCompleted\"]}"
  rule_status            = "ENABLE"
  target_id              = "tf-test"
  target_endpoint        = "acs:mns:cn-beijing:123456xxx:queues/tf-test"
  target_type            = "acs.mns.queue"
  param_list = {
    resource_key = "queue"
    form         = "CONSTANT"
    value        = "tf-test"
    template     = null
  }
  #alicloud_event_bridge_service_linked_role
  create_role            = true
  product_name           = "AliyunServiceRoleForEventBridgeSendToMNS"
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-eventbridge/tree/main/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.160.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.160.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)