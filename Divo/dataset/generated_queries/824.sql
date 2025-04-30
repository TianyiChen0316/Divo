--{"gen": "erase", "time": "/", "template": "generated-b7950c62-ccc4-4e38-b9d6-90fa6f7443f0", "dataset": "full_job", "rows": null}
SELECT *
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
aka_title AS at,
company_type AS ct,
movie_info AS mi
WHERE (k.keyword = 'character-name-in-title' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ct.id = mc.company_type_id)
