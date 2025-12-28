## これはなに
posgisをローカル環境で使うためのツールです。
バックエンドにnest.jsを入れてますが、使いません。

## ざっくりポイント
### postgresのDockerイメージ
- postgresのイメージをimage: postgis/postgis:14-3.4に設定
- docker exec -it postgres-db psql -U postgres -d postgresで接続
### geometoryを扱えるように設定
- CREATE EXTENSION IF NOT EXISTS postgis;で有効化
### geometoryデータを初期設定で入れる
#### データ注入例
- INSERT INTO sample (id, name, geom ) VALUES(nextval('sample_id_seq'), 'mrPoint', ST_GeomFromText('POINT(0 0)', 4326));
#### データ抽出例
- SELECT id, name, ST_AsText(geom), ST_SRID(geom) FROM sample;
