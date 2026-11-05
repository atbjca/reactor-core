# Tasks: 修正 GAV 坐标脱敏规则

## 1. 构建脚本调整
- [x] 1.1 修改 `gradle.properties`（更新 projectGroup 为 `cn.bjca.footstone.beactor`） <!-- id: 1.1 -->
- [x] 1.2 修改 `gradle/setup.gradle`（调整 artifactId 计算规则为 `bjca-footstone-beactor-*`） <!-- id: 1.2 -->

## 2. 文档与规约更新
- [x] 2.1 更新 `doc/REQUIREMENTS.md` <!-- id: 2.1 -->
- [x] 2.2 更新 `doc/GAV_MAPPING.md` <!-- id: 2.2 -->
- [x] 2.3 更新 `doc/VULNERABILITY_REPORT.md` 与 `doc/USER_MANUAL.md` <!-- id: 2.3 -->

## 3. 本地验证与归档
- [x] 3.1 执行 `make install` 重新发布到本地 MavenLocal <!-- id: 3.1 -->
- [x] 3.2 检查生成的 POM 与 JAR 文件 <!-- id: 3.2 -->
- [x] 3.3 执行 `openspec validate --all` 并归档提案 <!-- id: 3.3 -->
