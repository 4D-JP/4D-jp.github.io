---
layout: default
title: テクニカルノート
permalink: /notes/
icon: book
---

<div class="page clearfix">
<div class="wide">
<h1>{{page.title}}</h1>
<hr>
      
<ul>
{% for tech_note in site.tech_notes %}
<li>

    <a class="post-link" href="{{ tech_note.url | prepend: site.baseurl }}">{{ tech_note.title }}</a>

  <div class="label">
    <div class="label-card">
      <i class="fa fa-calendar"></i>{{ tech_note.date | date: "%F" }}
    </div>
    <div class="label-card">
    {% if tech_note.author %}<i class="fa fa-user"></i>{{ tech_note.author }}
    {% endif %}
    </div>
    <div class="label-card">
      {% if tech_note.meta %}<i class="fa fa-key"></i>{{ tech_note.meta }}  {% endif %}
    </div>
    <div class="label-card">
      {% include technote_category.html %}
    </div>
    <div class="label-card">
      {% include technote_tag.html %}
    </div>
  </div> 
  <div class="excerpt">
    {{tech_note.excerpt}}
  </div>
  <hr>
</li>
{% endfor %}
</ul>

</div>
</div>
