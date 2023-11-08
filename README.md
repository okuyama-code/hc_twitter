## よく使うコマンド
```
docker compose run --rm web bundle exec rubocop -A
```

```
docker compose run --rm web bin/htmlbeautifier
```

# 仕様
https://github.com/happiness-chain/practice/blob/main/11_Ruby_on_Rails/002_twitter_clone.md

# TODO

- すぐに確認できるようにユーザーと、ツイート、フォロー関係のseedを用意すること

# よく使うコマンド
```
sudo chmod -R 777 /home/okuyama/hc_twitter_clone/
```

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
