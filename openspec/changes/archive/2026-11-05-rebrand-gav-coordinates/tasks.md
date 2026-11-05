# Tasks: GAV 坐标脱敏改造

## 1. 脚本与配置修改
- [x] 1.1 修改 `gradle.properties`（设置 projectGroup 与 version） <!-- id: 1.1 -->
- [x] 1.2 修改 `build.gradle`（统一 subprojects group 引用） <!-- id: 1.2 -->
- [x] 1.3 修改 `gradle/setup.gradle`（配置 publication artifactId 与 manifest） <!-- id: 1.3 -->

## 2. 构建与本地发布验证
- [x] 2.1 执行 `make install` 编译并安装到 MavenLocal <!-- id: 2.1 -->
- [x] 2.2 检查生成的 POM 与 JAR 文件，验证 GAV 坐标与模块依赖 <!-- id: 2.2 -->
- [x] 2.3 运行 `openspec validate` 验证规范一致性 <!-- id: 2.3 -->
