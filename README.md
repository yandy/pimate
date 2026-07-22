# Pi Config for Mate

## 1. Setup

```sh
# install pi
npm install -g @earendil-works/pi-coding-agent

# clone config
git clone https://github.com/yandy/pimate.git ~/.pi/agent-mate
```

### add `pimate`

**fish**

`~/.config/fish/conf.d/pi.fish`

```fish
function pimate
  env PI_CODING_AGENT_DIR=$HOME/.pi/agent-mate pi $argv
end
```

**bash**

`~/.bashrc`

```fish
pimate() {
  PI_CODING_AGENT_DIR="$HOME/.pi/agent-mate" pi "$@"
}
```

### build container image

```sh
cd ~/.pi/agent-mate
docker build -t pi-container-sandbox:pimate -f pimate.Dockerfile .
```

## 2. Skills Management

### 2.1 Add skill

```sh
npx skills add <package> --skill <skills> -a pi -y
# eg.
npx skills add anthropics/skills --skill pdf docx -a pi -y
```

### 2.2 Update skills

```sh
npx skills update -a pi
```

### 2.3 Remove skills

```sh
npx skills remove <skills> -a pi
```

### 2.4 List skills

```sh
npx skills ls -a pi
```

### 2.5 Current skills

- skill-creator

```sh
# npx skills add anthropics/skills --skill skill-creator -a pi -y
```

- office

```sh
# npx skills add anthropics/skills --skill pdf docx pptx xlxs -a pi -y
```

- browser automation

```sh
npm install -g playwright @playwright/cli
playwright install chromium firefox
# npx skills add microsoft/playwright-cli --skill playwright-cli -a pi -y
```

- [glab](https://gitlab.com/gitlab-org/cli/)

```sh
pacman -S glab # or install from https://gitlab.com/gitlab-org/cli/-/releases
# glab skills install --path .pi/skills/
```
