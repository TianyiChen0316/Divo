--{"gen": "erase", "time": "/", "template": "generated-5e313317-4bad-48c7-8b58-6e4899c5b635", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
char_name AS chn,
role_type AS rt
WHERE (cn.country_code = '[jp]' AND k.keyword = 'character-name-in-title' AND rt.role = 'actress' AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id)
