--{"gen": "erase", "time": "/", "template": "generated-e1e08bbb-2e33-4ae5-81cb-782cecebb5e4", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS a1,
cast_info AS ci,
name AS n1
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND a1.person_id = n1.id AND n1.id = ci.person_id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
