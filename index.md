---
layout: home
title: Home
---

# The Japanese Maple Book

Welcome to the digital edition of *The Japanese Maple Book*. This guide explores the history, varieties, and care of *Acer palmatum*.

## Table of Contents

{% for part in site.data.navigation %}
{% if part.url %}
* [{{ part.title }}]({{ part.url | relative_url }})
{% else %}
### {{ part.title }}
{% for chapter in part.children %}
* [{{ chapter.title }}]({{ chapter.url | relative_url }})
{% endfor %}
{% endif %}
{% endfor %}

[Download EPUB Version]({{ 'book.epub' | relative_url }})
