---
title: "Week3"
author: "ssc"
date: "6/19/2020"
output: 
  html_document:
    keep_md: TRUE
---



Exercises
Use the built-in data frame longley to answer the following questions.

1. What year was the percentage of people employed relative to the population highest? Return the result as a data frame.


```r
longley %>% 
  datatable()
```

<!--html_preserve--><div id="htmlwidget-dfc6cdfa3bdba1047595" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-dfc6cdfa3bdba1047595">{"x":{"filter":"none","data":[["1947","1948","1949","1950","1951","1952","1953","1954","1955","1956","1957","1958","1959","1960","1961","1962"],[83,88.5,88.2,89.5,96.2,98.1,99,100,101.2,104.6,108.4,110.8,112.6,114.2,115.7,116.9],[234.289,259.426,258.054,284.599,328.975,346.999,365.385,363.112,397.469,419.18,442.769,444.546,482.704,502.601,518.173,554.894],[235.6,232.5,368.2,335.1,209.9,193.2,187,357.8,290.4,282.2,293.6,468.1,381.3,393.1,480.6,400.7],[159,145.6,161.6,165,309.9,359.4,354.7,335,304.8,285.7,279.8,263.7,255.2,251.4,257.2,282.7],[107.608,108.632,109.773,110.929,112.075,113.27,115.094,116.219,117.388,118.734,120.445,121.95,123.366,125.368,127.852,130.081],[1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962],[60.323,61.122,60.171,61.187,63.221,63.639,64.989,63.761,66.019,67.857,68.169,66.513,68.655,69.564,69.331,70.551]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>GNP.deflator<\/th>\n      <th>GNP<\/th>\n      <th>Unemployed<\/th>\n      <th>Armed.Forces<\/th>\n      <th>Population<\/th>\n      <th>Year<\/th>\n      <th>Employed<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
longley %>% 
  mutate(Emploey.rate = Employed/Population) %>% 
  arrange(desc(Emploey.rate)) %>% 
  datatable()
```

<!--html_preserve--><div id="htmlwidget-6c147d020d9d74d4e844" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-6c147d020d9d74d4e844">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"],[104.6,108.4,99,96.2,88.5,101.2,98.1,83,112.6,114.2,89.5,100,88.2,110.8,116.9,115.7],[419.18,442.769,365.385,328.975,259.426,397.469,346.999,234.289,482.704,502.601,284.599,363.112,258.054,444.546,554.894,518.173],[282.2,293.6,187,209.9,232.5,290.4,193.2,235.6,381.3,393.1,335.1,357.8,368.2,468.1,400.7,480.6],[285.7,279.8,354.7,309.9,145.6,304.8,359.4,159,255.2,251.4,165,335,161.6,263.7,282.7,257.2],[118.734,120.445,115.094,112.075,108.632,117.388,113.27,107.608,123.366,125.368,110.929,116.219,109.773,121.95,130.081,127.852],[1956,1957,1953,1951,1948,1955,1952,1947,1959,1960,1950,1954,1949,1958,1962,1961],[67.857,68.169,64.989,63.221,61.122,66.019,63.639,60.323,68.655,69.564,61.187,63.761,60.171,66.513,70.551,69.331],[0.571504371115266,0.565976171696625,0.564660190800563,0.564095471782289,0.562651888946167,0.562399904589907,0.561834554604044,0.560580997695339,0.556514760955206,0.554878437878885,0.551587051176879,0.54862802123577,0.548140253067694,0.545412054120541,0.542362066712279,0.542275443481526]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>GNP.deflator<\/th>\n      <th>GNP<\/th>\n      <th>Unemployed<\/th>\n      <th>Armed.Forces<\/th>\n      <th>Population<\/th>\n      <th>Year<\/th>\n      <th>Employed<\/th>\n      <th>Emploey.rate<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


2. The Korean war took place from 1950 - 1953. Filter the data frame so it only contains data from those years.

```r
longley %>% 
  filter(Year %in% 1950:1953) %>% 
  datatable()
```

<!--html_preserve--><div id="htmlwidget-41cacd927baad590c3b5" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-41cacd927baad590c3b5">{"x":{"filter":"none","data":[["1","2","3","4"],[89.5,96.2,98.1,99],[284.599,328.975,346.999,365.385],[335.1,209.9,193.2,187],[165,309.9,359.4,354.7],[110.929,112.075,113.27,115.094],[1950,1951,1952,1953],[61.187,63.221,63.639,64.989]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>GNP.deflator<\/th>\n      <th>GNP<\/th>\n      <th>Unemployed<\/th>\n      <th>Armed.Forces<\/th>\n      <th>Population<\/th>\n      <th>Year<\/th>\n      <th>Employed<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


3. What years did the number of people in the armed forces exceed the number of people unemployed?

```r
longley %>% 
  filter(Armed.Forces > Unemployed) %>% 
  datatable()
```

<!--html_preserve--><div id="htmlwidget-1a8e11c7cfc603e7e6a8" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-1a8e11c7cfc603e7e6a8">{"x":{"filter":"none","data":[["1","2","3","4","5"],[96.2,98.1,99,101.2,104.6],[328.975,346.999,365.385,397.469,419.18],[209.9,193.2,187,290.4,282.2],[309.9,359.4,354.7,304.8,285.7],[112.075,113.27,115.094,117.388,118.734],[1951,1952,1953,1955,1956],[63.221,63.639,64.989,66.019,67.857]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>GNP.deflator<\/th>\n      <th>GNP<\/th>\n      <th>Unemployed<\/th>\n      <th>Armed.Forces<\/th>\n      <th>Population<\/th>\n      <th>Year<\/th>\n      <th>Employed<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

