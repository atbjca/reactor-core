# Proposal: 初始化工程安全合规治理与文档体系

## Why
本项目为 `reactor-core` 的 3.4.x 维护分支（`3.4.x-bjca-patch`）。为了解决内部 SCA 工具对官方已知依赖扫描的阻断，并对该基础响应式组件进行长期的安全补丁维护、坐标脱敏发布与合规管理，需要参照 `spring-framework-5.3` 和 `spring-boot-2.7` 规范，建立完整的 OpenSpec 流程、安全漏洞台账、法律风险评估及免网本地构建体系。

## What Changes
1. **构建与本地化支持**：
   - 提供 `scripts/setup-gradle-local.sh` 脚本，自动探测并预热本地 `~/dev/gradle-8.6-bin.zip` 避免联网。
   - 提供工程根目录 `Makefile`，封装常用的构建、测试、安装和发布指令。
2. **文档治理体系 (`doc/`)**：
   - `doc/REQUIREMENTS.md`：记录 NES Fork 背景、SCA 规避、GAV 脱敏与包名兼容性约束。
   - `doc/GAV_MAPPING.md`：输出脱敏前后的 GAV 映射表。
   - `doc/LICENSE_RISK_ASSESSMENT.md`：进行全面的 Apache 2.0 法律合规评估并给出明确结论。
   - `doc/VULNERABILITY_REPORT.md`：建立归一化 6 态模型的漏洞总览。
   - `doc/CVE/`：针对已知核心漏洞（如 CVE-2026-47857、CVE-2026-47863）编写独立研判报告。
   - `doc/USER_MANUAL.md` 与 `doc/QUICK_START.md`：交付业务侧使用与快速入门指南。

## Capabilities
- **New Capabilities**:
  - `portable-gradle-bootstrap`: 免外网预热 Gradle Wrapper 缓存。
  - `cve-assessment`: 针对 Reactor Core 的漏洞状态判定与归一化管理。
  - `license-assessment`: 法律合规风险评估与结论输出。
  - `gav-rename`: GAV 坐标规范化。
