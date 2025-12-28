-- DB作成
CREATE DATABASE sample_db;
-- 作成したDBに接続
\c sample_db;
-- --postgisの作成
CREATE EXTENSION IF NOT EXISTS postgis;
-- テーブル作成
DROP TABLE IF EXISTS sample;
CREATE TABLE sample (
	id integer NOT NULL PRIMARY KEY,
	name char(100) NOT NULL,
    geom geometry,
	created_date_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- ID用シーケンス作成
CREATE SEQUENCE sample_id_seq START 1;
-- サンブルデータの登録
INSERT INTO sample (id, name, geom ) VALUES(nextval('sample_id_seq'), 'mrPoint', ST_GeomFromText('POINT(0 0)', 4326));
INSERT INTO sample (id, name, geom ) VALUES(nextval('sample_id_seq'), 'mrLinestring', ST_GeomFromText('LINESTRING(0 0, 1 1, 2 1, 2 2)', 4326));
INSERT INTO sample (id, name, geom ) VALUES(nextval('sample_id_seq'), 'mrPolygon', ST_GeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))', 4326));
INSERT INTO sample (id, name, geom ) VALUES(nextval('sample_id_seq'), 'mrGEOMETRYCOLLECTION', ST_GeomFromText('GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))', 4326));
