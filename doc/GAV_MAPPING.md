# GAV 映射表 (GAV_MAPPING.md)

以下列出了本项目中所有 Reactor 模块在脱敏改造前后的坐标映射关系，严格遵循 NES 全局生态规范（`spring` -> `bpring`, `reactor` -> `beactor`）。

## 映射总表

| 模块说明 | 原始 GroupId | 原始 ArtifactId | 原始 Version | 替换后 GroupId | 替换后 ArtifactId | 替换后 Version |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Reactor Core 核心库** | `io.projectreactor` | `reactor-core` | `3.4.42-SNAPSHOT` | `cn.bjca.footstone.beactor` | `bjca-footstone-beactor-core` | `3.4.42-nes.patch.1` |
| **Reactor Test 测试组件** | `io.projectreactor` | `reactor-test` | `3.4.42-SNAPSHOT` | `cn.bjca.footstone.beactor` | `bjca-footstone-beactor-test` | `3.4.42-nes.patch.1` |
| **Reactor Tools 诊断工具** | `io.projectreactor` | `reactor-tools` | `3.4.42-SNAPSHOT` | `cn.bjca.footstone.beactor` | `bjca-footstone-beactor-tools` | `3.4.42-nes.patch.1` |

> 注：`benchmarks` 模块为工程基准测试子工程，不作为独立构件对外分发，不设对外发布坐标。

## 业务使用示例

### Maven 配置
```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>cn.bjca.footstone.beactor</groupId>
            <artifactId>bjca-footstone-beactor-core</artifactId>
            <version>3.4.42-nes.patch.1</version>
        </dependency>
        <dependency>
            <groupId>cn.bjca.footstone.beactor</groupId>
            <artifactId>bjca-footstone-beactor-test</artifactId>
            <version>3.4.42-nes.patch.1</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

### Gradle 配置
```groovy
implementation 'cn.bjca.footstone.beactor:bjca-footstone-beactor-core:3.4.42-nes.patch.1'
testImplementation 'cn.bjca.footstone.beactor:bjca-footstone-beactor-test:3.4.42-nes.patch.1'
```

### 兼容性说明
本分支完全保留所有原始 package 名（如 `reactor.core.publisher.Flux`、`reactor.core.publisher.Mono` 等）。业务项目在替换坐标后，**无需修改任何 Java 源代码的 import 语句**。
