USE patentgraph;

LOAD DATA LOCAL INFILE 'patents.csv'
INTO TABLE patents
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patent_id, patent_title, patent_date, grant_year, patent_type);

LOAD DATA LOCAL INFILE 'assignees.csv'
INTO TABLE assignees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(assignee_id, assignee_name, assignee_country);

LOAD DATA LOCAL INFILE 'patent_assignees.csv'
INTO TABLE patent_assignees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patent_id, assignee_id);

LOAD DATA LOCAL INFILE 'ai_scores.csv'
INTO TABLE ai_scores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(doc_id, ai_overall, ai_score_ml, ai_score_nlp, ai_score_vision, ai_score_planning);

LOAD DATA LOCAL INFILE 'citations.csv'
INTO TABLE citations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(citing_patent_id, cited_patent_id);
