---
layout: page
title: テクニカルノート
permalink: /notes/
icon: book
type: page
---

* content
{:toc}

{% for tech_note in site.tech_notes %}
  <h1>{{ tech_note.title }}</h1>
  <h2>{{ tech_note.author }}</h2>
  <p>{{ tech_note.position }}</p>
{% endfor %}
