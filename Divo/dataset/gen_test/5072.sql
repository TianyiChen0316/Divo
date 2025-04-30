--{"gen": "erase", "time": "/", "template": "generated-19e401ab-6688-46a3-8f56-7e75cfe29e8c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM movie_companies AS mc,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
cast_info AS ci,
role_type AS rt
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(worldwide)%' AND cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND ci.note = '(voice: English version)' AND rt.role = 'actress' AND cn.id = mc.company_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
