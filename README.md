# The Japanese Maple Book

A comprehensive digital guide to *Acer palmatum*, available as a modern website and a downloadable EPUB.

## Overview

This project serves as a definitive resource for Japanese Maple enthusiasts, covering everything from cultivar selection to advanced bonsai techniques. It allows users to browse a vast library of cultivars with high-quality descriptions and images, while also providing deep-dive chapters on care and cultivation.

## Features

-   **Dual-Format Publishing**:
    -   **Web**: A responsive, searchable static site built with Jekyll.
    -   **EPUB**: A high-fidelity ebook generated automatically from the same source content.
-   **Cultivar Library**: A structured database of *Acer palmatum* varieties.
-   **Comprehensive Guide**: deeply researched chapters on purchasing, siting, soil, water, pruning, and pests.

## Tech Stack

-   **Website**: [Jekyll](https://jekyllrb.com/) with the [Just-the-Docs](https://just-the-docs.com/) theme.
-   **Ebook Engine**: [Pandoc](https://pandoc.org/) driven by custom Python scripts to process Liquid templates into EPUB-ready Markdown.
-   **Analytics**: Google Analytics 4 integration (web only).

## Build Instructions

### Prerequisites
-   Ruby & Bundler (for Jekyll)
-   Python 3 (for EPUB processing)
-   Pandoc (for EPUB generation)

### Building the Website
```bash
bundle install
bundle exec jekyll serve
```
Access the site at `http://localhost:4000/japanese-maple-book/`.

### Generating the EPUB
The EPUB generation script concatenates all chapters and cultivar files, resolves internal links, and produces a single `.epub` file in the `assets/` directory.

```bash
./scripts/generate_epub.sh
```

## Project Structure

-   `_cultivars/`: Individual markdown files for each Japanese Maple variety.
-   `chapters/`: Core content chapters (Care, Design, etc.).
-   `scripts/`: logic for converting the Jekyll site into a linear book format.
-   `_data/navigation.yml`: Defines the order of chapters for both the sidebar and the book.

## Credits

Developed by **RightEdges** with **Gemini AI**.
