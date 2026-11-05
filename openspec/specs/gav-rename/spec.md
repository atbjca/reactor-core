# gav-rename Specification

## Purpose
规范 Reactor Core 维护分支的 Maven GAV 坐标脱敏改造准则，满足 SCA 工具扫描规避，同时绝对保证 Java 代码层面的向下兼容。
## Requirements
### Requirement: 坐标映射与前缀统一

产物 GroupId MUST 统一命名为 `cn.bjca.footstone.beactor`，ArtifactId MUST 统一采用 `bjca-footstone-beactor-` 前缀并剥离原 `reactor-` 前缀。

#### Scenario: 坐标替换
- **WHEN** 配置项目发布坐标
- **THEN** MUST 将 `reactor-core` 映射为 `bjca-footstone-beactor-core`，GroupId 为 `cn.bjca.footstone.beactor`

### Requirement: Java 代码层绝对兼容

项目 SHALL 保留所有原始 package 名称，不得破坏现有业务代码的 import 语句。

#### Scenario: 业务接入兼容性
- **WHEN** 下游应用引入脱敏构件
- **THEN** 业务 Java 代码 SHALL 无需修改任何类导入或反射引用

