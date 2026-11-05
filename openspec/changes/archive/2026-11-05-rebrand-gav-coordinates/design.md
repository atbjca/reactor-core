# Design: GAV 坐标脱敏改造设计

## 架构与实现方案

### D1: 保持 Gradle 内部工程名不变，仅修改 Publication
- 保留 `settings.gradle` 中各子工程原生路径与名称（`reactor-core`、`reactor-test`、`reactor-tools`），确保工程内部任务依赖、构建插件（如 shadowJar, bnd, spotless 等）不发生断裂。
- 在 `gradle/setup.gradle` 的 `mavenJava(MavenPublication)` 中显式注入 `artifactId = "bjca-footstone-${project.name}"`。

### D2: 集中化配置 GroupId 与 Version
- 在 `gradle.properties` 中声明统一的 `projectGroup=cn.bjca.footstone.reactor` 与 `version=3.4.42-nes.patch.1`。
- `build.gradle` 的 `configure(subprojects)` 统一引用 `group = projectGroup`。

### D3: 子模块间 POM 依赖自动联动
- Gradle 的 `maven-publish` 插件在解析项目间依赖（如 `reactor-test` 依赖 `api project(':reactor-core')`）时，会自动查询并使用目标子工程 publication 中声明的 `groupId` 与 `artifactId`，确保在生成的 POM 中依赖为 `cn.bjca.footstone.reactor:bjca-footstone-reactor-core:3.4.42-nes.patch.1`。
