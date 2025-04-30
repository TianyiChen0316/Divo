--{"gen": "erase", "time": "/", "template": "e4b", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk
WHERE (mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = at.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = at.movie_id AND mk.movie_id = at.movie_id)
