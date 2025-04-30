--{"gen": "erase", "time": "/", "template": "generated-0636896c-c198-4d98-ac69-6c82b3d01dd1", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS alternative_name,
min(chn.name) AS voiced_character_name
FROM aka_name AS an,
char_name AS chn,
cast_info AS ci,
role_type AS rt
WHERE (ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND rt.role = 'actress' AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id)
