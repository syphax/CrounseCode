# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal code repository containing multiple independent Python projects organized by topic. Each project is primarily built around Jupyter notebooks (.ipynb files) for data analysis, web scraping, and automation tasks.

## Python Environment

- **Primary Python**: Python 3 (system: `/usr/bin/python3`)
- **Virtual Environments**:
  - `.venv/` - Python 3.9 environment
  - `venv-3-13/` - Python 3.13 environment
- **Running Notebooks**: Use Jupyter to execute `.ipynb` files. Each project typically has notebooks in a `nb/` subdirectory.

## Project Structure

The repository is organized into topic-based directories:

- **running/** - High school cross-country (XC) race results scraper and analyzer
  - Scrapes event data from athletic.net
  - Main notebook: `running/nb/get-xc-results.ipynb`
  - Data stored in: `running/data/`

- **latin/** - Latin text analysis and vocabulary matching tools
  - Uses CLTK (Classical Language Toolkit) for lemmatization
  - Main notebook: `latin/nb/lemma-a-latin-text.ipynb`
  - Vocab files in: `latin/files/`

- **web_monitoring/** - Web monitoring and automation scripts
  - Configuration stored in: `web_monitoring/data/config.json`

- **findmy/** - Apple FindMy device scanner utilities
  - Standalone Python scripts for BLE scanning

- **util/** - General utilities including photo management

- **viz/** - Data visualization notebooks (matplotlib, pandas)

- **flights/** - Flight information retrieval

- **photos/** - Photo file organization utilities

- **3dp/** - 3D printing projects and designs

- **VT Geo/** - Vermont geographic data analysis

- **fcpython/** - Football (soccer) data analysis inspired by FC Python

- **misc/** - Miscellaneous scripts (e.g., turtle graphics)

## Key Dependencies

Common libraries used across projects:
- **Data Analysis**: pandas, numpy
- **Web Scraping**: requests, BeautifulSoup (bs4), playwright (for JS-rendered pages)
- **NLP**: CLTK (Classical Language Toolkit for Latin)
- **Apple Ecosystem**: findmy (for FindMy device scanning)
- **Date/Time**: datetime, dateutil, pytz

## Working with Notebooks

### Data Management Pattern

Most projects follow this pattern:
- Notebooks in `{project}/nb/`
- Data files in `{project}/data/`
- Supporting files in `{project}/files/` or `{project}/etc/`

### Common Data Processing Pattern

The XC results scraper (running/nb/get-xc-results.ipynb) demonstrates the common pattern:
1. Define schema dictionaries for type enforcement
2. Load existing data from CSV (if exists)
3. Fetch new data from API/web
4. Merge with existing data, handle duplicates
5. Create timestamped backups before saving
6. Save updated data

Key function: `backup_if_exists()` creates timestamped backups (format: `filename-BAK-HH-MM-SS.ext`)

### Asynchronous Web Scraping

For JavaScript-rendered sites, the codebase uses Playwright with async/await:
- `start_browser()` - Creates persistent browser instance
- `fetch_page(browser, url)` - Fetches and parses page with BeautifulSoup
- Includes retry logic and timeout handling
- Always close browser with `close_browser(browser, playwright)`

## Running Projects

### XC Results Scraper (running/)

Key configuration flags in notebooks:
- `FLAG_SAVE = True` - Controls whether data is saved
- `FLAG_UPDATE_EXISTING = False` - Controls update behavior
- `FLAG_DEBUG = True` - Enables debug output

Data files:
- `db_events.csv` - Meet/event master list
- `db_event_details.csv` - Detailed event information
- `db_results.csv` - Individual race results

### Latin Text Analysis (latin/)

Workflow:
1. Place Latin text in `latin/files/`
2. Run `lemma-a-latin-text.ipynb` to lemmatize
3. Matches lemmas against AP Latin vocab list
4. Outputs Excel files with matched vocabulary

## Git Practices

- Main branch: `master`
- `.gitignore` excludes: data files (*.csv), images (*.png), PDFs, Excel files (*.xlsx), config files (config.json), virtual environments

## Important Notes

- **Config Files**: Projects like web_monitoring expect `config.json` in their data directory (ignored by git)
- **Large Data Files**: Most data files (.csv, .xlsx) are gitignored to keep repo size manageable
- **Backup Pattern**: Before overwriting data files, scripts create timestamped backups in the same directory
- **Notebook State**: Notebooks may contain output cells with execution results and data snapshots
