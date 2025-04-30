--{"gen": "combine", "time": "/", "template": "generated-eda31e77-db8a-47b7-b250-e07925c7ad1d", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM info_type AS it,
movie_companies AS mc,
company_type AS ct,
movie_info AS mi,
movie_info_idx AS miidx,
aka_title AS at,
char_name AS chn,
cast_info AS ci
WHERE (it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND ct.kind = 'production companies' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND ct.id = mc.company_type_id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND miidx.movie_id = at.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
