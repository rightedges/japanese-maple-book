---
layout: home
title: Home
---

# The Japanese Maple Book

Welcome to the digital edition of *The Japanese Maple Book*. This guide explores the history, varieties, and care of *Acer palmatum*.

## Table of Contents

{% for item in site.data.navigation %}
* [{{ item.title }}]({{ item.url | relative_url }})
{% endfor %}

[Download EPUB Version]({{ 'book.epub' | relative_url }})
