
---

# `DESIGN.md`

```md
# Design Document

By Sina Gholami Fashkhami

## Project Video

You can watch the project presentation video here:

https://youtu.be/9ajm75EZlII

## Scope

The purpose of PatentGraph is to analyze AI-related patent activity using a relational database built in MySQL.

This project focuses on:
- patent metadata
- company ownership of patents
- citation relationships between patents
- AI relevance scores from the AIPD dataset

Out of scope for version 1:
- full-text patent claims
- legal status tracking
- global patent offices outside the USPTO
- full inventor network analysis
- advanced dashboarding

## Functional Requirements

The database should allow a user to:

- store patent records
- store company / assignee records
- connect patents to assignees
- store AI relevance scores for patents
- store patent citation relationships
- run analytical SQL queries on trends, ranking, and impact

## Representation of Entities

### Patents

The `patents` table stores one row per patent.

Attributes:
- `id`: unique identifier for the patent
- `patent_title`: title of the patent
- `patent_date`: grant date
- `grant_year`: extracted year for time-based analysis
- `patent_type`: type/category of patent if available

Why this table exists:
This is the core entity of the database. Most analysis begins from the patent itself.

### Assignees

The `assignees` table stores organizations or companies associated with patents.

Attributes:
- `id`: unique identifier for the assignee
- `assignee_name`: company or organization name
- `assignee_country`: country of the assignee if available

Why this table exists:
A company can own many patents, and analysis of top organizations depends on separating assignee information into its own table.

### Patent-Assignees

The `patent_assignees` table is a bridge table for the many-to-many relationship between patents and assignees.

Attributes:
- `patent_id`
- `assignee_id`

Why this table exists:
A patent may have more than one assignee, and an assignee may appear on many patents.

### AI Scores

The `ai_scores` table stores AI relevance information for each patent.

Attributes:
- `id`: document identifier linked to the patent
- `ai_overall`: overall AI score
- `ai_score_ml`: machine learning score
- `ai_score_nlp`: natural language processing score
- `ai_score_vision`: computer vision score
- `ai_score_planning`: planning / reasoning score

Why this table exists:
This table allows the database to distinguish AI-related patents from non-AI patents and to compare different AI technology areas.

### Citations

The `citations` table stores directed citation relationships between patents.

Attributes:
- `citing_patent_id`
- `cited_patent_id`

Why this table exists:
Patent citations are useful for measuring impact and influence.

## Relationships

The relationships are:

- one patent can appear in many citation records
- one assignee can be linked to many patents
- one patent can have many assignees
- one patent has at most one AI score record in this simplified design

This leads to:
- one-to-many between patents and citations
- many-to-many between patents and assignees
- one-to-one or one-to-zero-one between patents and AI score records

## Entity Relationship Diagram

The following entity relationship diagram represents the structure of the PatentGraph database.

![Entity Relationship Diagram](Patent Assignment and-2026-03-14-113405.png)

## Design Choices

### Why normalization was used

I separated patents, assignees, AI scores, and citations into different tables to avoid repeating information and to make joins explicit. This improves consistency and makes the schema easier to extend.

### Why a bridge table was used

The relationship between patents and assignees is many-to-many, so a bridge table is the correct relational design.

### Why `grant_year` is stored directly

Although `grant_year` could be calculated from `patent_date`, storing it directly simplifies frequent yearly trend queries and improves readability.

### Why citations are stored as a separate table

Citations are naturally a relationship between two patents. Keeping them in their own table makes it easier to count inbound citations and later analyze networks.

### Why this version is limited to a subset

The source datasets are large, especially when combining PatentsView with AIPD. To keep the project realistic and reproducible, version 1 focuses on a subset of years and a smaller number of tables.

## Optimizations

The following indexes are included:

- index on `patents(grant_year)`
- index on `patents(patent_date)`
- index on `patent_assignees(id)`
- index on `ai_scores(ai_overall)`
- index on `citations(cited_patent_id)`

These indexes improve:
- yearly trend filtering
- assignee-based ranking
- filtering by AI score
- counting inbound citations

## Limitations

This design has some limitations:

- assignee name normalization may still be imperfect
- citation count alone does not fully measure patent quality
- the database does not yet include inventors, CPC classes, or full text
- AIPD scores are used as provided and are not recalculated inside the project

## Future Extensions

Possible future versions may include:

- inventor tables and collaboration networks
- CPC technology classification analysis
- country-level comparisons
- summary tables for reporting
- dashboards and visual analytics
