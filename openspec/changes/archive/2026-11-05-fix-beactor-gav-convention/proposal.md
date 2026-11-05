# Proposal: 修正 GAV 坐标脱敏规则以对齐 NES 命名空间体系

## Why
核验 NES 上下游工程（`spring-boot-2.7/doc/GAV 构建机制说明.md` 及 `spring-boot-2.7/doc/NES_GAV_MAPPING.md`）发现，此前的 GAV 命名脱敏存在两项偏差：
1. **GroupId 命名偏差**：原配置为 `cn.bjca.footstone.reactor`，而 NES 规范为首字母变异规则（r -> b），即 **`cn.bjca.footstone.beactor`**（如 Reactor Netty 对应 `cn.bjca.footstone.beactor.netty`）。
2. **ArtifactId 命名偏差**：原配置为 `bjca-footstone-reactor-core`，未剔除原 `reactor-` 前缀且未做变异，正确规则应为 **`bjca-footstone-beactor-core`**、**`bjca-footstone-beactor-test`**、**`bjca-footstone-beactor-tools`**。

为了与整个 NES 生态组件无缝协同，必须立即纠正。

## What Changes
1. **构建脚本**：
   - `gradle.properties`: 设置 `projectGroup=cn.bjca.footstone.beactor`
   - `gradle/setup.gradle`: 规范 artifactId 映射为 `"bjca-footstone-beactor-" + project.name.replace("reactor-", "")`，并更新 Manifest。
2. **文档体系**：
   - 更新 `doc/GAV_MAPPING.md`、`doc/REQUIREMENTS.md`、`doc/VULNERABILITY_REPORT.md` 与 `doc/USER_MANUAL.md`。
3. **本地验证**：
   - 执行 `make install` 重新编译安装，确认产物与 POM 依赖收敛至 `cn.bjca.footstone.beactor`。

## Capabilities
- **Modified Capabilities**:
  - `gav-rename`: 修正为标准 beactor 命名规范。
