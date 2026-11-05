# license-assessment Specification

## Purpose
规范 Reactor Core 项目自身及其第三方传递依赖的开源许可证法律风险排查、合规评估及结论产出。

## Requirements
### Requirement: 许可证审查覆盖范围

法律评估 MUST 覆盖工程自身产物、核心生产运行时依赖、可选扩展及构建测试依赖。

#### Scenario: 生产运行时依赖审查
- **WHEN** 引入或审计生产依赖
- **THEN** MUST 确认许可证属于宽松型开源协议且无传染性条款

### Requirement: 法律风险评估明确结论

评估报告 MUST 给出明确的工程与法律合规结论，指明是否存在阻断发布的法律与知识产权风险。

#### Scenario: 生成法律评估结论
- **WHEN** 完成依赖协议扫描
- **THEN** MUST 在报告首部标明黑白分明的合规结论
