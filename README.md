# prec_dbt_project

This repository contains a dbt project for transforming source data into a layered analytics pipeline with bronze, silver, and gold models.

## Project overview

The project is named `prec_dbt_project` and is structured around a standard medallion-style architecture:

- `models/bronze/` — raw or lightly staged source models
- `models/silver/` — cleaned, standardized, and business-ready transformations
- `models/gold/` — curated analytics models for downstream reporting and analysis
- `macros/` — reusable SQL logic and schema helpers
- `tests/` — data quality checks and validation logic
- `snapshots/` — snapshot definitions for tracking historical changes

## Source data

The project currently references these source entities:

- `fact_sales`
- `fact_returns`
- `dim_customer`
- `dim_product`
- `dim_date`
- `dim_store`
- `items`

These definitions are managed in `models/source/source.yml` and form the foundation of the transformation flow.

## Key folders

- `analyses/` — exploratory SQL used for investigation and validation
- `macros/` — reusable dbt macros used across models
- `models/bronze/` — initial ingestion and staging layer
- `models/silver/` — cleaned and standardized intermediate models
- `models/gold/` — final business-facing and aggregation models
- `tests/` — custom generic and SQL-based tests

## Dependencies

The project uses the following dbt package:

- `calogica/dbt_expectations` (`>=0.10.0, <0.11.0`)

Install dependencies with:

```bash
dbt deps
```

## Setup

1. Install dbt and your preferred adapter.
2. Make sure your `profiles.yml` contains a profile named `prec_dbt_project`.
3. From the project root, install dependencies:

```bash
dbt deps
```

4. Verify the connection and environment:

```bash
dbt debug
```

## Typical workflow

Run the whole project:

```bash
dbt run
```

Run tests:

```bash
dbt test
```

Compile SQL without materializing models:

```bash
dbt compile
```

Generate and serve documentation:

```bash
dbt docs generate
```

```bash
dbt docs serve
```

## Validation

The project includes data-quality checks in `tests/`, including custom validation rules to help ensure model reliability.

## Notes

- The default materialization settings are defined in `dbt_project.yml`.
- Update `profiles.yml` if your target database or credentials differ from the local setup.
- This project is intended to be extended with additional business logic as the analytics layer grows.

## Useful references

- dbt Documentation: https://docs.getdbt.com/
- dbt Packages: https://hub.getdbt.com/
- dbt Community: https://community.getdbt.com/
