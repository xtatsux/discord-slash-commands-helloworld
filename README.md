# discord-slash-commands-helloworld

[Slash CommandsでサーバレスなDiscordアプリを作る ｜ loop.run_forever()](https://note.sarisia.cc/entry/discord-slash-commands/)

こちらは、上記のブログを参考に、一部修正と自分の開発用の仕込みを追加したリポジトリです。

## Getting Started

VS CodeのRemote Container機能の利用を前提にした手順です。

1. リポジトリをクローン
2. VS Codeでディレトリを開く
3. `envfile.env.temp`を`envfile.env`にリネームし、`sam`コマンドを利用するためのAWSアカウント情報を埋める
4. VS Code Remote Container機能を利用して、`docker-compose.yml`を指定して、リポジトリのディレクトリをDockerコンテナで開く
5. AWS CLIコマンドと、AWS SAM CLIコマンドがセットアップ済みのコンテナが起動するので、そこで開発

## Run locally

1. Set environment variables in `.env.json`

```json
{
    "SlashCommandsCallbackFunction": {
        "DISCORD_TOKEN": "...",
        "APPLICATION_ID": "...",
        "APPLICATION_PUBLIC_KEY": "...",
        "COMMAND_GUILD_ID": "..."
    }
}
```

2. Start local API using aws-sam-cli

:info: Use ngrok or something to bypass request verification!

```
$ sam local start-api --env-vars ./.env.json
```

## Deploy to AWS

```
$ sam build
$ sam deploy --guided
```
