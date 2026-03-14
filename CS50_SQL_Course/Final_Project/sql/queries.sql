-- yearly AI patent trend
SELECT
    P.`grant_year`,
    COUNT(*) AS 'ai_patents_count',
    ROUND(AVG(A.`ai_overall`),3) AS 'avg_ai_score'
FROM `Patents` P
JOIN `AI_scores` A ON P.`id` = A.`id`
WHERE A.`ai_overall` >= 0.5
GROUP BY P.`grant_year`
ORDER BY P.`grant_year` DESC;

-- top 10 companies
SELECT ASSI.`assignee_name`, COUNT(DISTINCT(P.`id`)) AS 'total_ai_patents'
FROM `Patents` P
JOIN `AI_scores` A ON P.`id` = A.`id`
JOIN `Patent_assignees` PA ON PA.`patent_id` = P.`id`
JOIN `Assignees` ASSI ON PA.`assignee_id` = ASSI.`id`
WHERE A.`ai_overall` >= 0.5
GROUP BY ASSI.`assignee_name`
ORDER BY `total_ai_patents` DESC
LIMIT 10;

-- top cited patents
SELECT P.`id`, P.`patent_title`, COUNT(C.`cited_patent_id`) AS 'citation_count'
FROM `Patents` P
LEFT JOIN `Citations` C ON P.`id` = C.`cited_patent_id`
GROUP BY P.`id`, P.`patent_title`
ORDER BY `citation_count` DESC
LIMIT 20;

-- year-over-year company growth
WITH `yearly_company_patents` AS (
    SELECT
        ASSI.`assignee_name`,
        P.`grant_year`,
        COUNT(DISTINCT P.`id`) AS 'patents_count'
    FROM `Patents` P
    JOIN `AI_scores` A
        ON P.`id` = A.`id`
    JOIN `Patent_assignees` PA
        ON P.`id` = PA.`patent_id`
    JOIN `Assignees` ASSI
        ON PA.`assignee_id` = ASSI.`id`
    WHERE A.`ai_overall` >= 0.5
    GROUP BY ASSI.`assignee_name`, P.`grant_year`
)
SELECT
    `assignee_name`,
    `grant_year`,
    `patents_count`,
    `patents_count` - LAG(`patents_count`) OVER (
        PARTITION BY `assignee_name`
        ORDER BY `grant_year`
    ) AS `yoy_growth`
FROM `yearly_company_patents`;
