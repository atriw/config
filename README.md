# Nix Configuration

[![Nix](https://img.shields.io/badge/built_with-nix-blueviolet?style=for-the-badge&logo=nixos)](https://nixos.org)
[![Digga](https://img.shields.io/badge/divnix-digga-blueviolet?style=for-the-badge&logo=nixos)](https://github.com/divnix/digga)

This repository is home to the nix code that builds my systems.

## Why Nix?

Nix allows for easy to manage, collaborative, reproducible deployments. This means that once something is setup and configured once, it works forever. If someone else shares their configuration, anyone can make use of it.

## My Packages

### ChatGPT CLI

#### Usage

**Use as python script**

Some dependencies are required:
```sh
pip install "typer[all]"
pip install openai
pip install toml
```
And then
```sh
python bin/chat --help
```

**Installed script bin via Nix**

If nix is installed and flake enabled, just
```sh
chat --help

 Usage: chat [OPTIONS] [QUERY]...

╭─ Arguments ──────────────────────────────────────────────────────────────────╮
│   query      [QUERY]...                                                      │
╰──────────────────────────────────────────────────────────────────────────────╯
╭─ Options ────────────────────────────────────────────────────────────────────╮
│ *  --openai-api-token          TEXT                   [env var:              │
│                                                       OPENAI_API_TOKEN]      │
│                                                       [required]             │
│    --model                     [gpt-3.5-turbo|gpt-3.  [default: Model.GPT35] │
│                                5-turbo-0301]                                 │
│    --temperature               FLOAT RANGE [x<=1]     [default: 0]           │
│    --log-level                 [CRITICAL|ERROR|WARNI  [default:              │
│                                NG|INFO|DEBUG|NOTSET]  LogLevel.INFO]         │
│    --run-dir           -d      PATH                   Additional path to     │
│                                                       search prompts and     │
│                                                       profiles               │
│    --profile           -p      PATH                   Read a toml profile as │
│                                                       default options        │
│    --help                                             Show this message and  │
│                                                       exit.                  │
╰──────────────────────────────────────────────────────────────────────────────╯
╭─ Chunk Options ──────────────────────────────────────────────────────────────╮
│ --chunk-lines        INTEGER RANGE [x>=0]  Chunk piped inputs into multiple  │
│                                            chunks by chunk_lines. Send       │
│                                            chunks with the same system and   │
│                                            session prompts. Collect and      │
│                                            merge all results sequentially. 0 │
│                                            means no chunk.                   │
│                                            [default: 0]                      │
╰──────────────────────────────────────────────────────────────────────────────╯
╭─ Prompt Options ─────────────────────────────────────────────────────────────╮
│ --continue       -c            Continue last session                         │
│ --system-prompt  -s      PATH  Additional system prompts files               │
│ --session                PATH  Specify session file                          │
╰──────────────────────────────────────────────────────────────────────────────╯
╭─ Display Options ────────────────────────────────────────────────────────────╮
│ --with-pager     --no-with-pager       Open results with pager               │
│                                        [default: no-with-pager]              │
│ --with-panel     --no-with-panel       Wrap results in panel                 │
│                                        [default: with-panel]                 │
│ --only-result    --no-only-result      Only display chat result, no prompt   │
│                                        [default: no-only-result]             │
╰──────────────────────────────────────────────────────────────────────────────╯
```

Note that you can pipe input as user prompt like
```sh
echo "Yes, it's very close. The subway station is next to the hotel. You can walk there." | chat Translate the following into Chinese.
```

#### Prompts and Profiles

Prompts and profiles are place under config/chatty/prompts and config/chatty/profiles.

Prompts are system prompt for ChatGPT. And Profiles are options showed above in toml.

You can use prompts like this
```
cat <some-japanese-text-file> | chat -s J-To-C-Translation --chunk-lines=100 Translate the following text:
```

Or use profiles
```sh
cat <some-japanese-text-file> | chat -p translate-syuuni # already take care of --chunk-lines and query
```

Prompt files are searched under current directory, <xdg config>/chatty/, and "prompts" subdir under them.
Profile files are searched under the same base directories and "profiles" subdir.

If no exact files are found, file name will be attached with proper suffix and searched again. For prompt file,
the suffix is ".txt", for profile file, ".toml".

Additional base search directory can be Specified by `--run-dir` option.
