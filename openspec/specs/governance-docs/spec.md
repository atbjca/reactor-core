# governance-docs Specification

## Purpose
TBD - created by archiving change init-governance-and-docs. Update Purpose after archive.
## Requirements
### Requirement: 工程安全与合规治理文档化

项目 MUST 建立完整的安全与合规治理文档集，涵盖业务需求、GAV 坐标映射、法律风险评估、漏洞总览及单个 CVE 独立分析。

#### Scenario: 建立全套治理文档
- **WHEN** 初始化工程安全治理框架
- **THEN** 项目 MUST 在 `doc/` 目录下生成 `REQUIREMENTS.md`、`GAV_MAPPING.md`、`LICENSE_RISK_ASSESSMENT.md`、`VULNERABILITY_REPORT.md` 及 `doc/CVE/*.md`

### Requirement: 本地化构建脚本与免网预热

项目 SHALL 提供 Makefile 及 Gradle Wrapper 本地缓存预热机制，保证离线环境流畅编译。

#### Scenario: 离线构建支持
- **WHEN** 开发者执行 `make setup-gradle`
- **THEN** 脚本 MUST 自动识别 `~/dev` 目录下对应的 Gradle 发行包并完成预热

