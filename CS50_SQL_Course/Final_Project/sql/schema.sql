CREATE DATABASE IF NOT EXISTS `patentgraph`;
USE `patentgraph`;

CREATE TABLE `Patents` (
    `id` VARCHAR(32) PRIMARY KEY,
    `patent_title` TEXT NOT NULL,
    `patent_date` DATE,
    `grant_year` INT,
    `patent_type` VARCHAR(50)
);

CREATE TABLE `Assignees`(
    `id` BIGINT PRIMARY KEY,
    `assignee_name` VARCHAR(255) NOT NULL,
    `assignee_country` VARCHAR(100)
);

CREATE TABLE `AI_scores` (
    `id` VARCHAR(32) PRIMARY KEY,
    `ai_overall` DECIMAL(6,4),
    `ai_score_ml` DECIMAL(6,4),
    `ai_score_nlp` DECIMAL(6,4),
    `ai_score_vision` DECIMAL(6,4),
    `ai_score_planning` DECIMAL(6,4)
);

CREATE TABLE `Patent_assignees` (
    `patent_id` VARCHAR(32) NOT NULL,
    `assignee_id` BIGINT NOT NULL,
    PRIMARY KEY (`patent_id`, `assignee_id`),
    CONSTRAINT `fk_pa_patent`
        FOREIGN KEY (`patent_id`) REFERENCES `Patents`(`id`),
    CONSTRAINT `fk_pa_assignee`
        FOREIGN KEY (`assignee_id`) REFERENCES `Assignees`(`id`)
);

CREATE TABLE `Citations` (
    `citing_patent_id` VARCHAR(32) NOT NULL,
    `cited_patent_id` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`citing_patent_id`, `cited_patent_id`),
    CONSTRAINT `fk_citing_patent`
        FOREIGN KEY (`citing_patent_id`) REFERENCES `Patents`(`id`),
    CONSTRAINT `fk_cited_patent`
        FOREIGN KEY (`cited_patent_id`) REFERENCES `Patents`(`id`)
);

CREATE INDEX `patents_grant_year` ON `Patents`(`grant_year`);
CREATE INDEX `patents_date` ON `Patents`(`patent_date`);
CREATE INDEX `patent_assignees_assignee` ON `Patent_assignees`(`assignee_id`);
CREATE INDEX `ai_score_overall` ON `AI_scores`(`ai_overall`);
CREATE INDEX `citation_cited` ON `Citations`(`cited_patent_id`);


