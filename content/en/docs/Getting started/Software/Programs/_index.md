---
title: "Programs and subroutines"
linkTitle: "Programs"
weight: 262
description: >
  Software to apply computational models to data and to report the resulting analyses are released as programs or sub-routines.
---

## Language and output formats
Currently all our programs are written in R Markdown and typically generate reporting documents in file formats such as PDF, Word and HTML. 

## Programs
Programs can be executed in their current form without the need for additional input data and, unless modified or run interactively (prompting a user for inputs during execution), will always generate the exact same output. They are typically deployed for configuring the run specifications of a computational model, specifying the data to which it will be applied and reporting analysis results.

## Sub-routines
Sub-routines need to be called by programs that supply them with input data. They can be called by multiple programs and will produce output that varies based on the input values they are supplied with. They are typically deployed to implement parts of a model's analysis and reporting algorithm.

## Documentation
ready4 programs and sub-routines are typically self-documenting, meaning that each section of code is integrated with plain English descriptions of the purpose it fulfills. The only programs and sub-routines that are not self-documenting are those whose primary purpose is to produce a document (normally an analysis report). Self-documenting programs and sub-routines will be typically documented as a PDF or HTML render of the RMarkdown source file. This rendered document will be bundled with the program, but in some cases may also be shared in online data repositories. Documentation for all other ready4 programs and sub-routines will typically take the form as notes contained in a README file.



