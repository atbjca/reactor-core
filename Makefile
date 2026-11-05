.PHONY: clean test install deploy build build-thin stop help setup-gradle projects docs check

# Gradle 本地发行包配置脚本路径
SETUP_GRADLE := ./scripts/setup-gradle-local.sh

help: ## 显示帮助信息
	@echo ""
	@echo "可用命令:"
	@echo "  make setup-gradle - 用本地精确匹配的 Gradle zip 预热 wrapper 缓存；缺包则回退 HTTPS 下载"
	@echo "  make clean        - 清理构建产物"
	@echo "  make test         - 运行测试"
	@echo "  make build-thin   - 编译打包（跳过测试与文档）"
	@echo "  make build        - 编译打包（全量，含测试）"
	@echo "  make install      - 编译并安装到本地 MavenLocal（跳过耗时文档）"
	@echo "  make deploy       - 发布到 Nexus 私服"
	@echo "  make docs         - 生成项目文档 (Asciidoc/Javadoc)"
	@echo "  make stop         - 停止所有 Gradle Daemon"
	@echo "  make projects     - 查看有效的项目/子模块"
	@echo ""
	@echo "Gradle 本地配置："
	@echo "  默认扫描 ~/dev/gradle-*-{bin,all}.zip"
	@echo "  可通过 LOCAL_GRADLE_DIR=/path/to/zips make setup-gradle 指定其他目录"
	@echo ""

# 使用 LOCAL_GRADLE_DIR 下与 Wrapper 配置精确匹配的 Gradle zip 预热缓存
setup-gradle: ## 配置本地 Gradle 发行包（无需网络下载）
	@LOCAL_GRADLE_DIR="$(LOCAL_GRADLE_DIR)" UNPACK=1 "$(SETUP_GRADLE)"

clean: setup-gradle ## 清理构建产物
	./gradlew clean

test: setup-gradle ## 运行测试
	./gradlew test

build: setup-gradle clean ## 编译打包（含完整测试）
	./gradlew build

build-thin: setup-gradle clean ## 编译打包（瘦身版，跳过测试与文档生成）
	./gradlew assemble -x test -x javadoc -x asciidoc -x asciidoctor -x asciidoctorPdf -x spotlessJavaCheck -x spotlessCheck

# 编译并安装到本地 Maven 仓库（跳过测试和耗时的文档生成）
install: setup-gradle
	./gradlew publishToMavenLocal -x test -x javadoc -x asciidoc -x asciidoctor -x asciidoctorPdf -x docsZip -x spotlessJavaCheck -x spotlessCheck

# 发布到 Nexus 私服（跳过测试和耗时的文档生成）
deploy: setup-gradle
	./gradlew publish -x test -x javadoc -x asciidoc -x asciidoctor -x asciidoctorPdf -x docsZip -x spotlessJavaCheck -x spotlessCheck

docs: setup-gradle clean ## 专门用于生成文档
	./gradlew asciidoctor

stop: ## 停止所有 Gradle Daemon
	./gradlew --stop

projects: setup-gradle ## 查看有效的项目
	./gradlew projects
