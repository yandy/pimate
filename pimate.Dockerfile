# ============================================================
# docx + pdf + pptx + xlsx 四个skill的容器方案
# 基于 Debian，包含系统依赖 + pip/npm 包
# ============================================================
FROM pi-container-sandbox:latest AS base

USER root

# ----- 1. 系统依赖（apt）-----
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    # 通用工具
    poppler-utils \
    pandoc \
    qpdf

USER pi

RUN set -eux; \
    npm install -g @larksuite/cli dingtalk-workspace-cli @ast-grep/cli; \
    uv tool install ruff
