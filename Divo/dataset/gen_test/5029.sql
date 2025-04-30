--{"gen": "combine", "time": "/", "template": "16b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
char_name AS chn,
complete_cast AS cc,
movie_info AS mi,
movie_link AS ml,
title AS t1
WHERE (k.keyword = 'character-name-in-title' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND chn.id = ci.person_role_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id)
