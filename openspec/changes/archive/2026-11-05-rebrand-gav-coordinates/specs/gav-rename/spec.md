# gav-rename Specification

## MODIFIED Requirements
### Requirement: 坐标映射与前缀统一

产物 GroupId MUST 统一命名为 `cn.bjca.footstone.reactor`，ArtifactId MUST 统一前缀为 `bjca-footstone-`，版本号定为 `3.4.42-nes.patch.1`。

#### Scenario: 坐标替换
- **WHEN** 配置项目发布坐标
- **THEN** MUST 将 `reactor-core` 映射为 `bjca-footstone-reactor-core`，版本为 `3.4.42-nes.patch.1`
