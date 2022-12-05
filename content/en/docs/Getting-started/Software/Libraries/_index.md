---
title: "Code libraries"
linkTitle: "Libraries"
weight: 262
description: >
  Code libraries are used to distribute software for applying our framework and implementing computational model modules. 
---

## Types of ready4 code libraries
ready4 code libraries (all currently R packages) are used to provide:
- tools for applying and extending a consistent modelling framework; and
- modules of computational models developed with that framework.

### Framework libraries

The two types of framework libraries are:

- ![](https://img.shields.io/badge/ready4-foundation-coral?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAFzUkdCAK7OHOkAAAAEZ0FNQQAAsY8L/GEFAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAIXRFWHRDcmVhdGlvbiBUaW1lADIwMjI6MDM6MDcgMTY6MTM6NTPZeG5UAAABa0lEQVQ4T4WT607CQBCFpyUi3qIR0eAfNfCi/vENfEgENIAIlcJ6vr1oLaZOerJzdst0zpklc49nznqHZs6ZfWwDem1xM1sqXwtXkb8rL4SuOLEoLXPPXWfD01Dg9dPsrTQbngQ+EZ+LDyIfiy/FHyIfFZbbTslWKOOqxx/uWBPSfp07FahGlqlNfWGqL9HNfBO+CAfwdO55WS8g4MFML834sfJVA9e7vwsg50aGohncdmRojV9XeL+jArRNmZxVSJ4Acj3NHqARdyeFJqC2KJiCfKE9zsfxnNYTl5TcCtmNMcwY/ZXf+3wdzzVza2vj4iCaq3d1R/bvwVSH6IPjNIUHx0FSNZA7WquDqOVb35+eiO8h7Oe+vRfp0a3yGtFMDuiAIg2R20YaVwJ3Hj+4kehO/J/I7VJ/jHtpvBP6mrHnR4EzdyQ0xI8HhM8jUiChxVpDK3iVuadzx43yRdI4E2d0gNtX74TCs419AR8YEST/cHPBAAAAAElFTkSuQmCC) - the foundational ready4 module and syntax; and

 - ![](https://img.shields.io/badge/ready4-authoring-maroon?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) -  tools to implement standardised, semi-automated workflows for authoring and documenting computational models.
 
### Module libraries
Computational models developed with ready4 are intended to be both generalisable (they are tools that can be used in multiple decision contexts) and modular (they are comprised of self-contained components, each of which performs a narrow sub-set of tasks). For these reasons, ready4 computational models are developed and distributed as libraries of modules. The three types of computational module libraries are:
 
  - ![](https://img.shields.io/badge/ready4-description-navy?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules for describing and quality assuring model data;
  
 - ![](https://img.shields.io/badge/ready4-modelling-indigo?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules to specify, assess and report statisitical models; and
 
 - ![](https://img.shields.io/badge/ready4-prediction-forestgreen?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules for making predictions.


## Documentation
All ready4 code libraries have a documentation website, the URL of which typically takes the form of `https://ready4-dev.github.io/PACKAGE_NAME` (for example the website for the foundational ready4 R package is https://ready4-dev.github.io/ready4). 
