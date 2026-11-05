# Design: 对齐 NES beactor 命名体系

## 架构与修正方案

### D1: GroupId 变异规则
对齐 NES 全局生态规范（`spring` -> `bpring`, `logback` -> `bogback`, `reactor` -> `beactor`），统一设置 `cn.bjca.footstone.beactor`。

### D2: ArtifactId 前缀去重与变异
规范替换逻辑：
- `project.name` 为 `reactor-core` 时，剥离 `reactor-` 得到 `core`，附加前缀 `bjca-footstone-beactor-`，生成最终 `bjca-footstone-beactor-core`。
- 同理，`reactor-test` -> `bjca-footstone-beactor-test`，`reactor-tools` -> `bjca-footstone-beactor-tools`。
- 在 `gradle/setup.gradle` 中通过动态表达式处理，保持配置优雅简洁。
