---
layout: default
title: ヒント
permalink: /tips/
icon: question
---

<div class="page clearfix" notes>
      <div class="left">
      <h1>{{page.title}}</h1>
      <hr>
      <ul>
      {% for tech_tip in site.tech_tips reversed %}
      <li>
      <h2><a class="post-link" href="{{ tech_tip.url | prepend: site.baseurl }}">{{ tech_tip.title }}</a></h2>      
    
        <div class="label">
              
          <div class="label-card">
            <i class="fa fa-calendar"></i>{{ tech_tip.date | date: "%F" }}
          </div>
              
          <div class="label-card">
          {% if tech_tip.author %}<i class="fa fa-user"></i>{{ tech_tip.author }}
          {% endif %}
          </div>
          
          <div class="label-card">
            {% if tech_tip.meta %}<i class="fa fa-key"></i>{{ tech_tip.meta }}  {% endif %}
          </div>
        
            {% capture categories %}
                {% for category in tech_tip.categories %}
                    <a href="{{ root_url }}/{{ site.category_dir }}#{{ category }}" title="Category: {{ category }}" rel="category">{{ category | join: "/" }}</a>{% unless forloop.last %}&nbsp;{% endunless %}
                {% endfor %}
            {% endcapture %}
            {% capture category_size %}{{ categories | strip_newlines | replace: ' ', '' | size }}{% endcapture %}
            {% unless category_size == '0' %}
            <div class="label-card">
                <span class="categories">
                  <i class="fa fa-th-list"></i>{{ categories }}
                </span>   
            </div>            
            {% endunless %}
            
            {% capture tags %}
                {% for tag in tech_tip.tags %}
                    <a href="{{ root_url }}/{{ site.tag_dir }}#{{ tag }}" title="Tag: {{ tag }}" rel="tag">{{ tag | join: "/" }}</a>{% unless forloop.last %}&nbsp;{% endunless %}
                {% endfor %}
            {% endcapture %}   
            {% capture tag_size %}{{ tags | strip_newlines | replace: ' ', '' | size }}{% endcapture %}
            {% unless category_size == '0' %}
            <div class="label-card">
              <span class="pageTag">
              <i class="fa fa-tags"></i>{{ tags }}
            </span>
            </div>            
            {% endunless %}        
        
        </div> 
        <div class="excerpt">
          {{tech_tip.excerpt}}
        </div>
        
      </li>
      {% endfor %}
      </ul>
      </div>
</div>

