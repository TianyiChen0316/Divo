--{"gen": "combine", "time": "/", "template": "generated-a296dbe8-5511-45c3-8912-8b75a322a9e3", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx,
cast_info AS ci,
movie_keyword AS mk,
keyword AS k,
name AS n
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2008 AND 2014 AND kt.kind = 'movie' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id)
