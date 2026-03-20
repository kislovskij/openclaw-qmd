FROM ghcr.io/openclaw/openclaw:slim

USER root

ENV BUN_INSTALL=/usr/local/bun
ENV PATH="${BUN_INSTALL}/bin:${PATH}"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates curl unzip && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://bun.sh/install | bash && \
    ln -sf /usr/local/bun/bin/bun /usr/local/bin/bun && \
    ln -sf /usr/local/bun/bin/bunx /usr/local/bin/bunx

# Installs /usr/local/bin/qmd; qmd itself still needs bun at runtime.
RUN npm install -g @tobilu/qmd

USER node
