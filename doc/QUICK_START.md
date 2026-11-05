# 快速入门指南 (QUICK_START.md)

本指南指导开发者如何在本地快速构建、测试并发布 Reactor Core 自维护分支。

---

## 1. 环境准备

- **JDK**: JDK 17（推荐运行 Gradle）或 JDK 8+，编译目标生成 1.8 字节码。
- **Gradle**: 默认使用工程内置 Wrapper（版本为 8.6）。
  - 若处于内网或离线环境，请确保 `~/dev/gradle-8.6-bin.zip` 存在。工程脚本会自动预热，免外网下载。
- **构建工具**: GNU Make (macOS 自带或通过 homebrew 安装)。

---

## 2. 常用构建指令

工程根目录已配备与 `spring-framework-5.3` 一致的 `Makefile`：

```bash
# 1. 预热本地 Gradle 缓存（自动检索 ~/dev/gradle-8.6-bin.zip）
make setup-gradle

# 2. 快速编译打包（跳过测试与文档生成）
make build-thin

# 3. 运行完整测试套件
make test

# 4. 全量构建
make build

# 5. 安装到本地 MavenLocal 仓库 (~/.m2/repository)
make install

# 6. 查看所有子模块与工程
make projects
```

---

## 3. 极速本地验证示例

```bash
make setup-gradle
make build-thin
```

若构建成功，产物将生成在各模块下的 `build/libs/` 目录中。
