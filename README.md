# prec_dbt_project

A dbt project for building a layered analytics pipeline from raw source data into bronze, silver, and gold models.

## Project overview

This repository defines a dbt project named `prec_dbt_project`. It includes:

- `bronze/` models for raw staging and ingestion logic
- `silver/` models for cleaned, standardized data
- `gold/` models for aggregated or business-ready outputs
- `macros/` for reusable SQL functions and schema generation
- `tests/` for data quality checks and custom generic tests
- `packages.yml` to manage dbt package dependencies

## Key directories

- `models/bronze/` — raw ingestion models and source staging
- `models/silver/` — cleaned, standardized, and enriched models
- `models/gold/` — business layer models and analytics output
- `models/source/` — source definitions and metadata
- `macros/` — custom dbt macros used across the project
- `tests/` — custom tests including non-negative validation logic
- `analyses/` — ad hoc analysis SQL files
- `seeds/` — seed data definitions (if needed)
- `snapshots/` — snapshot configurations

## Dependencies

This project uses the following dbt package dependency defined in `packages.yml`:

- `calogica/dbt_expectations` version `>=0.10.0, <0.11.0`

Run `dbt deps` to install package dependencies before running the project.

## Setup

1. Install dbt for your target adapter.
2. Ensure your dbt `profiles.yml` contains a profile named `prec_dbt_project`.
   - This project is configured to use the profile name from `dbt_project.yml`.
3. From the project root, install dependencies:

```bash
dbt deps
```

4. Optional: clean build artifacts before running the project:

```bash
dbt clean
```

## Typical workflow

Build the entire project:

```bash
dbt run
```

Run tests:

```bash
dbt test
```

Compile SQL and review the DAG without executing transformations:

```bash
dbt compile
```

Show the project DAG and model relationships:

```bash
dbt docs generate
```

## Common commands

- `dbt debug` — validate your profile and connection
- `dbt run` — execute model builds
- `dbt test` — run dbt tests
- `dbt compile` — compile models without running them
- `dbt docs generate` — build documentation artifacts
- `dbt docs serve` — view docs locally

## Testing and validation

This project includes structured tests to validate model data quality.

- Custom generic tests are defined in `tests/generic/`
- Non-negative checks and other validations are located in `tests/`

## Notes

- Model materialization defaults are configured in `dbt_project.yml`.
- The project is organized using a common bronze/silver/gold architecture for analytics workflows.
- Update `profiles.yml` and adapter configuration as needed for your environment.

## Resources

- dbt docs: https://docs.getdbt.com/
- dbt community: https://community.getdbt.com/
- dbt packages: https://hub.getdbt.com/
