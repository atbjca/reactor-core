# 业务需求说明 (REQUIREMENTS.md)

## 背景
我们 fork 并维护了官方已停止维护的反应式核心库 Project Reactor Core（基于 3.4.x 系列的 `reactor-core`、`reactor-test`、`reactor-tools` 等模块），在源码层面参照官方更高版本（3.8.x / Enterprise）手动 backport 已知 CVE 的修复补丁。计划长期自行维护并发布到公司内部 Maven 仓库（Nexus）。

## 面临问题
公司强制执行 SCA 扫描（软件成分分析与依赖安全检查）。这些工具一旦识别出原始 GAV（`io.projectreactor:reactor-*`）或强特征，即使已经修补，也会依据公开漏洞库报高危漏洞并阻断构建/发布流程。

## 目标
在**完全不修改任何 Java 源代码的 package 名、类名、类路径、导入语句**的前提下：
让这个自维护版本在主流 SCA 工具的扫描结果中尽量**不被判定为官方有漏洞的 Reactor 组件**。

下游业务项目接受：
- 批量修改 `pom.xml` 或 `build.gradle` 中的依赖坐标。

不能接受：
- 修改业务 Java 代码的 import 语句或类引用机制（破坏 import 兼容性）。

## 具体改动
- **groupId 统一改为**：`cn.bjca.footstone.beactor`
- **artifactId 统一前缀**：`bjca-footstone-beactor-` + 去掉原`reactor-`前缀：
  - `reactor-core` $\rightarrow$ `bjca-footstone-beactor-core`
  - `reactor-test` $\rightarrow$ `bjca-footstone-beactor-test`
  - `reactor-tools` $\rightarrow$ `bjca-footstone-beactor-tools`
- **version 规范**：原版本号 + `-nes.patch.N`（首发版本基线为 `3.4.42-nes.patch.1`）

## 关键约束
1. 只涉及构建脚本 GAV 层面的修改，绝对保持 Java 代码层与运行时二进制兼容性。
2. 保持对外公开的 Reactive Streams 规范契约不变。
3. 任何代码级别的 CVE 修复遵循测试驱动开发（TDD），必须具备充分的单元测试用例与回回归验证。
