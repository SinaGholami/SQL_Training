# PatentGraph (MySQL)

PatentGraph is a portfolio SQL project built with **MySQL 8.0** to analyze **AI-related patents** using public patent data.

The project combines:
- **USPTO PatentsView** data for patent metadata, assignees, and citations
- **AIPD (Artificial Intelligence Patent Dataset)** for AI relevance scores

## Project Goal

The goal of this project is to answer questions such as:

- How has AI patent activity changed over time?
- Which companies own the most AI patents?
- Which patents have the highest citation impact?
- Is there a relationship between AI relevance and citation count?

This project is designed as a strong final SQL portfolio project, inspired by the structure expected in **CS50 SQL**:
- clear schema design
- normalized relational tables
- meaningful analytical SQL queries
- documentation of design decisions and trade-offs

## Data Sources

### 1. PatentsView
PatentsView is a USPTO platform that provides structured patent data for research and analysis.

Used here for:
- patent metadata
- assignees
- patent-assignee relationships
- citations

### 2. AIPD
The Artificial Intelligence Patent Dataset (AIPD) classifies U.S. patents and publications for AI relevance and AI component scores.

Used here for:
- overall AI score
- component-level AI scores such as ML, NLP, and Vision

## MVP Scope

To keep the project manageable, this first version includes only:

- granted patents
- AI-related patents
- years **2018 to 2023**
- core analytical tables only

## Database Schema

Main tables:

- `patents`
- `assignees`
- `patent_assignees`
- `ai_scores`
- `citations`

## Example Questions Answered

- yearly trend of AI patents
- top companies by number of AI patents
- year-over-year company growth in AI patenting
- most cited AI patents
- average AI score by year

## Tech Stack

- **MySQL 8.0**
- SQL scripts for schema, indexes, and analytics
- optional Python scripts for data loading and cleaning
- GitHub for version control and documentation

## Repository Structure

```text
patentgraph-mysql/
├── README.md
├── DESIGN.md
├── sql/
│   ├── schema.sql
│   ├── queries.sql
│   └── load_data.sql
├── data/
└── docs/
    ├── erd.png
    └── screenshots/
