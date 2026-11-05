# portable-gradle-bootstrap Specification

## Purpose
规范 Gradle Wrapper 本地发行包自动探测与缓存预热机制，确保在离线或内网弱网环境下实现零网络下载快速构建。

## Requirements
### Requirement: 本地发行包探测与预热

项目 SHALL 提供脚本读取 Wrapper 目标版本，并优先在本地 `~/dev` 检索预热。

#### Scenario: 探测到本地精确 zip
- **WHEN** 运行 `make setup-gradle` 且 `~/dev/gradle-<version>-bin.zip` 存在
- **THEN** 脚本 MUST 校验并解压到 Wrapper 缓存目录，执行 `./gradlew` 免联网
