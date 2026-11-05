# 许可证与法律风险评估报告 (LICENSE_RISK_ASSESSMENT.md)

> **评估日期**: 2026-11-05  
> **评估版本**: Reactor Core `3.4.42-nes.patch.1`（分支 `3.4.x-bjca-patch`）  
> **评估范围**: 项目源码自身、依赖库许可、分发形式及专利风险  

---

## 核心法律结论

> [!IMPORTANT]
> **法律评估结论：无实质法律风险，可以继续自主维护并分发。**
> 
> 1. **无传染性风险**：本项目及所有编译/运行时生产依赖均采用宽松型开源协议（Permissive Licenses，主要为 Apache 2.0 与 CC0 1.0），**不包含任何 GPL/AGPL/LGPL 等强传染性或弱传染性开源许可证**。
> 2. **允许私有与内部二次分发**：根据 Apache 2.0 第 4 条，本分支在企业内部仓库发布、打包或商业化使用完全合规。
> 3. **合规义务满足**：本项目保留了上游原有的 `LICENSE` 与版权声明头，完全满足开源合规义务。

---

## 一、项目自身许可证审查

| 项目 | 详情 | 合规结论 |
| :--- | :--- | :--- |
| **项目名称** | Project Reactor Core | - |
| **开源许可证** | **Apache License, Version 2.0** | 宽松商业友好许可证 |
| **版权所有者** | Copyright (c) 2011-2024 VMware, Inc. or its affiliates. | 保留原有版权声明 |
| **修改权与分发权** | 允许商业使用、修改、分发与再许可 | 完全合规 |

### 遵循 Apache 2.0 的必要合规义务：
1. **保留 NOTICE / LICENSE**：仓库根目录完整保留上游 `LICENSE` 文本。
2. **源码修改说明**：遵循 Apache 2.0 第 4(b) 条规定，对修改过的 Java 源码文件保留原有协议头并做相应版本/变更说明。
3. **商标合规**：使用自定义内部 Maven 坐标（`cn.bjca.footstone.reactor`），避免侵犯上游商标权益。

---

## 二、生产与运行时依赖许可证闭包核验

对 `reactor-core`、`reactor-test`、`reactor-tools` 的直接与传递依赖进行全量排查：

| 依赖坐标 (GAV) | 用途 | 开源许可证 | 传染性判定 | 法律风险分析 |
| :--- | :--- | :--- | :---: | :--- |
| `org.reactivestreams:reactive-streams:1.0.4` | 核心响应式规范接口 (必选) | **CC0 1.0 Universal (Public Domain)** | **无** | 极度宽松，放弃全部版权诉求，无任何商业与衍生限制。 |
| `io.micrometer:micrometer-core` | 指标采集适配 (可选/Optional) | **Apache License 2.0** | **无** | 宽松型协议，与主工程协议一致。 |
| `com.google.code.findbugs:jsr305` | 静态代码分析注解 (可选/Provided) | **Apache License 2.0 / BSD** | **无** | 宽松型协议，无风险。 |

### 测试与构建时依赖（非生产交付依赖）
- JUnit 5 (`EPL-2.0` - 仅测试期使用，不随二进制分发)
- AssertJ (`Apache-2.0`)
- Mockito (`MIT`)
- ArchUnit (`Apache-2.0`)
- BlockHound (`Apache-2.0`)

> 测试环境依赖不打包进最终生产 runtime jar 包，不构成衍生分发风险。

---

## 三、专利与商业风险分析

- **专利授权**：Apache 2.0 包含明确的专利授权条款（Patent Grant），上游贡献者授予了用户永久的、全球性的、免版税的专利使用许可，且具备专利反诉防御条款。
- **SCA 与坐标变更合规性**：对 GAV 坐标（GroupId/ArtifactId）的自定义重命名符合软件再分发的命名规范，不存在恶意冒充官方商业制品的问题。

---

## 四、最终核验签字与审计意见

本工程 `3.4.42-nes.patch.1` 属于合规的 Apache 2.0 内部衍生版本，未引入任何双重许可（Dual-License）、商业限制性条款（SSPL、BSL）或 Copyleft 许可证，**经审查不存在阻断发布的法律与知识产权风险**。
