Terraform Module for creating EventBridge resources on Alibaba Cloud.

terraform-alicloud-eventbridge
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云自动化管理消息事件总线 EventBridge，包括总线、源、规则、服务授权访问等
。

本 Module 支持创建以下资源:

* [alicloud_event_bridge_event_bus](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_event_bus)
* [alicloud_event_bridge_event_source](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_event_source)
* [alicloud_event_bridge_rule](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_rule)
* [alicloud_event_bridge_service_linked_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/event_bridge_service_linked_role)

## 用法

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
## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-eventbridge/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.160.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.160.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)