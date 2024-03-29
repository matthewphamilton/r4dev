---
title: "Why ready4 is object oriented"
linkTitle: "Paradigm"
date: "2022-12-23"
description: "ready4 uses an object oriented programming (OOP) paradigm to implement computational models."
weight: 61
categories: 
- Documentation
tags: 
- Framework
- Object Oriented Programming
- ready4 (library)
output: hugodown::md_document
rmd_hash: 9717828ced7db652

---

{{% pageinfo %}} This below section renders a vignette article from the ready4 library. You can use the following links to:

-   [view the vignette on the library website (adds useful hyperlinks to code blocks)](https://ready4-dev.github.io/ready4/articles/V_03.html)
-   [view the source file](https://github.com/ready4-dev/ready4/blob/main/vignettes/V_03.Rmd) from that article, and;
-   [edit its contents](https://github.com/ready4-dev/ready4/edit/main/vignettes/V_03.Rmd) (requires a GitHub account). {{% /pageinfo %}}

<div class="highlight">

</div>

<div class="highlight">

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://ready4-dev.github.io/ready4/'>ready4</a></span><span class='o'>)</span></span></code></pre>

</div>

## Motivation

The practical utility and ease of use of computational models of mental health systems are in part shaped by the choice of programming paradigm used to develop them. ready4 adopts an object oriented programming (OOP) paradigm which in practice means that the framework principally consists of classes (representations of data structures useful for modelling mental health systems) and methods (algorithms that can be applied to these data-structures to generate insight useful for policy-making). Adopting an OOP approach is particular useful for making the [ready4 model](https://www.ready4-dev.com) both modular and transparent.

## Implementation

### Modular Computational Models

Two commonly noted features of OOP - encapsulation and inheritance are particularly useful when developing [modular computational models](https://ready4-dev.github.io/ready4/articles/V_01.html).

#### Encapsulation

Encapsulation allows us to define the data structures ("classes") used in computational modelling projects in a manner that allows them to be safely combined. For example, assume there are two computational models, one (**A**) focused on predicting the types and intensity of services used by individuals that present to mental health services and the other (**B**) that [predicts outcomes for recipients of these services](https://ready4-dev.github.io/youthu/articles/Prediction_With_Mdls.html). It may be desirable to develop a new model (**C**) that combines **A** and **B** to model both service use and outcomes. Using encapsulated code allows all of the features and functionality of **A** can be made available to **B** in a manner that protects the integrity of **A**. Specifically, **B** can only interact with **A** using the algorithms ("methods") that have been already defined for **A**.

Furthermore, if appropriately implemented, methods associated with a class will work with any combination of input values that can be encapsulated by that class - making computational models more generalisabe. For example, imagine a class (**X**) that is used to structure summary data relevant to mental health systems. Methods associated with **X** (e.g. a method to derive an unmet need statistic) can then applied to two instances of **X** - one containing data relevant to the Australian context and one with data from the UK context.

#### Inheritence

The examples highlighted in the previous section have some potential limitations. What if the developers of **A** didn't define methods that would allow **B** to interact with it in the desired way? Or what if there are a number of differences between the Australian and UK system that need to be accounted for when generalising a method from the former to the latter? These types of issues can be addressed by another key feature of OOP - inheritance. Inheritance allows for a "child" class to be created from a "parent" class. By default, the "child" inherits all of the features of the "parent" including all methods associated with the "parent" class. Importantly however, alternative or additional features can also be specified for the "child" to allow it to implement different methods where necessary. For example, when developing our new computational model **C** we could create a number of new classes that are children of the classes defined in **A**. We can then define any additional/alternative methods for these classes that overcome any integration issues between the classes and methods of **A** and **B**. In this way, we can enjoy the best of both worlds - leveraging all relevant algorithms from **A** and **B** (as there is no need to re-invent the wheel), while ensuring that we transparently develop the additional code required for **C**. This approach also ensures that the respective contributions of the (potentially different) authorship teams behind **A**, **B** and **C** is clearer.

Similarly, inheritance would allow re-use of much of the code from a model of the Australian mental health system when exploring similar topics within the UK context, while making it straightforward to develop additional code that addresses relevant divergence in features between the two jurisdictions. In practical terms, this would mean developing two child classes of **X** - class **Y** for use with Australian data and class **Z** for use in the UK system. All methods that are not specific to a particular jurisdiction are defined for **X** and inherited by **Y** and **Z**. Methods that are only appropriate for use in the Australian context are defined for **Y**, while UK specific methods are defined for **Z**.

### Transparent Computational Models

To make analyses implemented using the ready4 model more readily understood, the `ready4` package provides the model's [simple and consistent syntax](https://ready4-dev.github.io/ready4/articles/V_02.html). Such simplified approaches are facilitated by two other commonly noted features of OOP - polymorphism and abstraction.

#### Polymorphism

Polymorphism allows for similar concepts to be represented using consistent syntax. The same top level code can therefore be generalised to multiple model implementations, making algorithms simpler to understand and easier to re-use.

Returning to a previous example, the exact same command (e.g. a call to the method [exhibit](https://ready4-dev.github.io/ready4/reference/exhibit-methods.html)) can be applied to both **Y** (used for Australian data) and **Z** (used for UK data). However, the algorithm implemented by that command can vary based on the class that each method is applied to (ie a different algorithm is applied when the data is specified as being from the UK compared to being specified as Australian).

#### Abstraction

The simplicity enabled by polymorphism is enhanced by Abstraction, which basically means that only the briefest and easiest to comprehend parts of the code are exposed by default to potential users. Once an instance of a class is created, the entire program to ingest model data, analyse it and produce a scientific summary can be represented in a few brief lines of code, readily comprehensible to non-coders. When using open source languages, the elegance and simplicity of abstraction [does not restrict the ability of more technically minded users exploring the detailed workings of the underpinning code](https://ready4-dev.github.io/ready4fun/articles/V_01.html).

