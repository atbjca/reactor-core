# Proposal: GAV 坐标脱敏改造与构建发布就绪

## Why
在公司强制 SCA 安全扫描背景下，原版 GAV 坐标（`io.projectreactor:reactor-*`）即使在源码层修复了漏洞，仍然会被扫描工具按版本直接阻断。
为解决此问题，需依照 `doc/REQUIREMENTS.md` 与 `doc/GAV_MAPPING.md` 的规范，对构建脚本中的 GAV 坐标实施脱敏，使生成的制品 GroupId 变更为 `cn.bjca.footstone.reactor`，ArtifactId 变更为 `bjca-footstone-reactor-*`，版本号提升为 `3.4.42-nes.patch.1`。
同时，必须确保 Java 代码层（包名、接口、类名）100% 保持原生兼容。

## What Changes
1. **`gradle.properties`**：
   - 增加 `projectGroup=cn.bjca.footstone.reactor`；
   - 更新版本号 `version=3.4.42-nes.patch.1`。
2. **`build.gradle`**：
   - 将 `subprojects` 的 `group` 从硬编码的 `io.projectreactor` 改造为读取 `projectGroup`（默认 `cn.bjca.footstone.reactor`）。
3. **`gradle/setup.gradle`**：
   - 在 `publishing.publications.mavenJava` 中配置 `artifactId = "bjca-footstone-${project.name}"`；
   - 更新 JAR 的 `manifest.attributes["Implementation-Title"] = "bjca-footstone-${project.name}"`。
4. **本地验证**：
   - 运行 `make install` 验证打包并发布到 `~/.m2/repository`；
   - 检查生成的 POM 文件确认 groupId、artifactId 及子模块依赖坐标是否完全脱敏且正确。

## Capabilities
- **Modified Capabilities**:
  - `gav-rename`: 实现 GAV 脱敏构建发布。
