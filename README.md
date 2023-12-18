## よく使うコマンド
```
sudo chmod -R 777 /home/okuyama/hc_twitter_clone/
```

# TODO
- 通知メール送信を実装する
- 通知のseedファイルを作成


```
docker compose run --rm web bundle exec rubocop -A
```

```
docker compose run --rm web bin/htmlbeautifier
```
erbをslimに変換
erbファイルの末尾に「_(アンダースコア)」をつける。こうすることでerbファイルは読み込まれなくなります。
```
erb2slim app/views/
```
元のerbファイルを削除
```
erb2slim app/views/ -d
```
これで元のファイルを編集できる。
```
vim /usr/local/bundle/gems/html2slim-0.2.0/lib/html2slim/converter.rb
```

## TODO branchの派生の順番
現在のブランチの位置 notification

user → tweet → like → repost → follow → bookmark　→ message(DM) → notification

# 仕様
https://github.com/happiness-chain/practice/blob/main/11_Ruby_on_Rails/002_twitter_clone.md


# ショートカット
tab　複製 (chome)
Alt + D + Enter

ブランチの削除
ローカル
git branch -d twitter-sub

リモート
git push origin --delete twitter-sub

## setup


```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## 備考

- Taskのscaffoldが含まれていますが、CIの動作確認用です。
適宜削除いただければと思います。（そのままでも問題ないです）

## rubocop

rubocopがすべて通ってからレビュー依頼を出してください。

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erbのフォーマッターです。
フォーマッターを通してからレビュー依頼を出してください。

```
docker compose run --rm web bin/htmlbeautifier
```
