# gav-rename Specification

## MODIFIED Requirements
### Requirement: 坐标映射与前缀统一

产物 GroupId MUST 统一命名为 `cn.bjca.footstone.beactor`，ArtifactId MUST 统一采用 `bjca-footstone-beactor-` 前缀并剥离原 `reactor-` 前缀。

#### Scenario: 坐标替换
- **WHEN** 配置项目发布坐标
- **THEN** MUST 将 `reactor-core` 映射为 `bjca-footstone-beactor-core`，GroupId 为 `cn.bjca.footstone.beactor`
