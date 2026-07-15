---
layout: default
title: "Appendix A: Cultivar Library & Quick Reference"
parent: "Part VII: Appendices"
has_children: true
nav_order: 1
permalink: /chapters/appendix-a-cultivar-library.html
---

# Appendix A: Cultivar Library & Quick Reference

Explore detailed profiles for each of the Japanese Maple cultivars mentioned in this guide, organized by their botanical groupings as defined in the **Group Selection Matrix**.

---

{% assign palmatum = site.cultivars | where: "group", "Palmatum" %}
## 1. Palmatum Group (The Genetic Standard)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in palmatum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign amoenum = site.cultivars | where: "group", "Amoenum" %}
## 2. Amoenum Group (Broad-Leafed Elegance)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in amoenum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign matsumurae = site.cultivars | where: "group", "Matsumurae" %}
## 3. Matsumurae Group (The Textural Deep-Cut)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in matsumurae %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign dissectum = site.cultivars | where: "group", "Dissectum" %}
## 4. Dissectum Group (The Lace-leaf Maples)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in dissectum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign linearilobum = site.cultivars | where: "group", "Linearilobum" %}
## 5. Linearilobum Group (The Bamboo Maples)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in linearilobum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign dwarf = site.cultivars | where: "group", "Dwarf" %}
## 6. Dwarf Group (Small-Space Heroes)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in dwarf %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign variegated = site.cultivars | where: "group", "Variegated" %}
## 7. Variegated Group (The Spotted Divas)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in variegated %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign shirasawanum = site.cultivars | where: "group", "Shirasawanum" %}
## 8. Shirasawanum Group (The Golden Full Moons)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in shirasawanum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

{% assign japonicum = site.cultivars | where: "group", "Japonicum" %}
## 9. Japonicum Group (The Downy Maples)

| Cultivar | Habit | Sun Tolerance | Best Feature |
| :--- | :--- | :--- | :--- |
{% for cultivar in japonicum %}| [{{ cultivar.title }}]({{ cultivar.url | relative_url }}) | {{ cultivar.habit }} | {{ cultivar.sun_tolerance }} | {{ cultivar.best_feature }} |
{% endfor %}

---

## Note on Hardiness
Almost all cultivars listed above are hardy to **USDA Zones 5-9**. However, for container-grown trees, remember the "2-Zone Rule" (see Chapter 8).

---

[← Previous: 18. Maple Bonsai Introduction]({{ site.baseurl }}/chapters/18-bonsai.html) | [Next: Appendix B →]({{ site.baseurl }}/chapters/appendix-b-comparison-chart.html)
