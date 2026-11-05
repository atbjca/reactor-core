# Design: 安全合规治理与文档体系设计

## 架构与设计决策

### D1: OpenSpec 流程与规范驱动
遵循 OpenSpec 规范，以 `schema: spec-driven` 组织。所有的变更与需求通过 proposals、tasks 与 specs 明确约定。

### D2: 漏洞状态归一化六态模型
严格采用已统一的标准状态：
1. `已修复 (✅)`: 补丁已合入且测试通过。
2. `免疫 (⬜)`: 经代码分析当前版本线不受影响。
3. `不适用 (❌)`: 误报或仅属于非生产依赖。
4. `修复中 (🔧)`: 补丁正在移植或验证。
5. `已缓解 (⚠️)`: 已有防护方案但非代码根治。
6. `暂缓 (⏸️)`: 存在阻断或无法直接修复。

### D3: 法律风险评估原则
遵循 Apache 2.0 许可证准则，核验所有交付物、NOTICE 文件与 Third-Party 依赖（`reactive-streams`）。工程结论必须黑白分明。

### D4: 免网本地构建设计
通过 `scripts/setup-gradle-local.sh` 按照 Gradle Wrapper 散列算法在 `~/.gradle/wrapper/dists/` 下建立映射软链或解压预热，解耦外网网络依赖。
