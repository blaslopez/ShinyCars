ShinyCars
========================================================
author: Blas López
date: May 17, 2015

Target 
========================================================

The target is demonstrate the capabilities of shiny applications

- Navigation bar
- Widgets
- Other feathures

The application is so simple in order to focalized in shiny features

Navigation
========================================================

The application is divied in three parts. 
Any of these parts are included in a tab.
- Info. Describes the application
- Charts. Shows some charts interating with widgets
- Table. Shows a table with the data

Charts
========================================================

The Charts page uses the simple `cars` dataset


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```
This dataset is about the relation between speed and stopping
distance.


Features
========================================================

- Selector for the chart type and geometry (for combined chart)
- Checkboxes for show/hide summary and mean line (for histograms)
- Slider for select number of breaks
- Navigation bar for separate diferents application environments
- Including markdown with instructions
- Conditional panes (according to chart type) helps to get a clear interface
- DESCRIPTION file configures the showmode 
- Tables
