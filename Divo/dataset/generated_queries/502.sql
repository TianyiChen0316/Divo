--{"gen": "erase", "time": "/", "template": "generated-ba77817e-2c47-4e68-b98a-49bfcbe25b9b", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
cast_info AS ci,
name AS n
WHERE (mc.note LIKE '%(VHS)%' AND mc.note LIKE '%(worldwide)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info < '7.0' AND n.name LIKE '%B%' AND mc.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
