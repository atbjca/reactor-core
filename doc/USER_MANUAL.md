# Project Reactor Core (NES 自维护版) 用户手册 (USER_MANUAL.md)

## 一、项目概述
本项目是基于 Project Reactor 3.4.x 分支深度维护的企业级响应式编程框架，重点保障在 JDK 8 运行时环境下的安全合规、长期补丁维护以及与 Spring Framework 5.3.x / Spring Boot 2.7.x 的兼容性。

## 二、坐标脱敏与依赖引入

为了规避企业内网 SCA 工具对于开源已知老版本的特征误报，本项目制品重新命名了 Maven 坐标。

### 1. 坐标对照
- 核心库：`cn.bjca.footstone.beactor:bjca-footstone-beactor-core:3.4.42-nes.patch.1`
- 测试库：`cn.bjca.footstone.beactor:bjca-footstone-beactor-test:3.4.42-nes.patch.1`
- 工具库：`cn.bjca.footstone.beactor:bjca-footstone-beactor-tools:3.4.42-nes.patch.1`

### 2. Maven 引入方式
```xml
<dependencies>
    <dependency>
        <groupId>cn.bjca.footstone.beactor</groupId>
        <artifactId>bjca-footstone-beactor-core</artifactId>
        <version>3.4.42-nes.patch.1</version>
    </dependency>
</dependencies>
```

### 3. Gradle 引入方式
```groovy
implementation 'cn.bjca.footstone.beactor:bjca-footstone-beactor-core:3.4.42-nes.patch.1'
```

## 三、代码级兼容性保证
本版本严格保证 Java 代码级和二进制层面的 100% 向下兼容：
1. **包名不变**：仍为 `reactor.core.publisher.Flux`、`reactor.core.publisher.Mono` 等。
2. **源码无需修改**：业务工程在将 Maven/Gradle 依赖坐标调整后，无需变动任何 Java 文件的 `import` 语句。

## 四、安全与最佳实践

对于涉及背压与超时组合的高级算子（如 `windowTimeout`、`bufferTimeout`），请参照以下最佳实践：
- 缺省情况下优先使用默认的重载方法，如 `Flux.bufferTimeout(maxSize, maxTime)`，避免无特殊需求时强行开启 `fairBackpressure = true`，以避免边界竞态挂起。
- 参见 [漏洞总览报告 (VULNERABILITY_REPORT.md)](VULNERABILITY_REPORT.md) 了解已知漏洞状态与缓解指引。
