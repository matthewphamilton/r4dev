---
title: "Explore ready4 software"
linkTitle: "Explore"
weight: 268
tags:
- Dependencies
- Functions
- R packages
categories:
- Software
- Documentation
description: >
  Search for ready4 functions and dependencies using our interactive app.
---

Most of the "under the hood" work performed by ready4 software is implemented by brief multi-purpose algorithms called functions. These in turn are powered by software written by contributors to other third party open-source projects. 

Using the DependenciesGraphs R package, we have created a Shiny app to:

- explore the inter-dependencies between ready4 libraries;
- highlight how our software depends on other R packages;
- itemise the contents each ready4 library;
- display function help files; and 
- map function inter-dependencies across multiple ready4 libraries.

Note that the help files for ready4 functions are currently all automatically authored by tools from our ready4fun package. In the future we hope to augment this machine generated documentation with human-authored documentation.

{{< iframe src = "https://orygen.shinyapps.io/dependencies/" >}}