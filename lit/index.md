---
title: Entangled
subtitle: literate programming for the new millennium
footer: "[![](img/escience_white.png){style='height: 20pt'}](https://esciencecenter.nl/)"
license:  "[Apache 2](https://www.apache.org/licenses/LICENSE-2.0)"
github: "https://github.com/entangled/entangled.py/"
---

<div class="container-fluid"><div class="row">
:::: {#synopsis}
- **Literate Programming** made easy
- Create **live documents** in Markdown
- Program in **any language** you like
- Use your **favourite editor/IDE**
- Works well with **version control**
::::

> **Entangled** is a tool that allows to `entangle` code and text in a simple Markdown document. 

</div></div>

# Get Started

With the 2.0 release, Entangled is now available as a Python package, installable through `pip`,

```bash
pip install entangled_cli
```

Or using `poetry`,

```bash
poetry add entangled_cli
```


<script async id="asciicast-591604" src="https://asciinema.org/a/591604.js"
        data-autoplay="true" data-speed="2"></script>

# About
Entangled helps you write Literate Programs in Markdown. You put all your code inside Markdown code blocks. Entangled automatically extracts the code and writes it to more traditional source files. You can then edit these generated files, and the changes are being fed back to the Markdown.

We're trying to increase the visibility of Entangled. If you like Entangled, please consider adding this badge [![Entangled badge](https://img.shields.io/badge/entangled-Use%20the%20source!-%2300aeff)](https://entangled.github.io/) to the appropriate location in your project:

> ~~~
> [![Entangled badge](https://img.shields.io/badge/entangled-Use%20the%20source!-%2300aeff)](https://entangled.github.io/)
> ~~~

# Features

#### Build hook example
::: {.example}
:::: {.given-input}
~~~markdown
The snippet for generating the data is given 
as a dependency for that data; to generate 
the figure, both result.csv and the code snippet 
are dependencies.

``` {.python .build target="result.csv"}
import pandas as pd
import numpy as np

data = {'x': np.arange(10),
        'y': np.random.rand(10)}
df = pd.DataFrame(data)
df.to_csv("result.csv")
```

``` {.python .build target="plot.svg" deps="result.csv"}
import pandas as pd

df = pd.read_csv("result.csv")
plot = df.plot()
plot.savefig("plot.svg")
```
~~~
::::
:::: {.generated-output}
The snippet for generating the data is given as a dependency for that data; to generate the figure, both result.csv and the code snippet are dependencies.
``` {.python .build target="data/result.csv"}
import pandas as pd
import numpy as np

data = {'x': np.arange(10),
        'y': np.random.rand(10)}
df = pd.DataFrame(data)
df.to_csv("data/result.csv")
```

``` {.python .build target="fig/plot.svg" 
    deps="data/result.csv"}
import pandas as pd

df = pd.read_csv("data/result.csv")
plot = df.plot()
plot.savefig("fig/plot.svg")
```
::::
:::


# Write Markdown {#section-markdown}

> "A critical aspect of a programming language is the means it provides
for using names to refer to computational objects." [Abelson, Sussman & Sussman - SICP](https://mitpress.mit.edu/sites/default/files/sicp/index.html)

#### Name your code
::: {.example}
:::: {.given-input}
~~~markdown
 The square of the hypothenuse is the sum
 of the two right-angled sides squared:
 $$a^2 + b^2 = c^2$$

 ``` {.python #pythagoras}
 def vector_length(x, y):
     return sqrt(x**2 + y**2)
 ```
~~~
::::
:::: {.generated-output}
The square of the hypothenuse is the sum of the two right-angled sides squared:
$$a^2 + b^2 = c^2$$

``` {.python #pythagoras}
def vector_length(x, y):
    return sqrt(x**2 + y**2)
```
::::
:::

> "Let us change our traditional attitude to the construction of programs:
> Instead of imagining that our main task is to instruct a computer what to do,
> let us concentrate rather on explaining to human beings what we want a
> computer to do." [Knuth - Literate Programming](http://www.literateprogramming.com/knuthweb.pdf)

#### Compose your program
::: {.example}
:::: {.given-input}
~~~markdown
 To count the words in a sentence, first
 split the sentence into words, then
 count the number of words in the list.

 ``` {.python #word-count}
 def word_count(sentence):
     <<split-into-words>>
     <<count-words>>
     return count
 ```

 The default arguments to the `.split`
 method split on any white space.

 ``` {.python #split-into-words}
 words = sentence.split()
 ```

 Counting is done with the `len`
 function.

 ``` {.python #count-words}
 count = len(words)
 ```
~~~
::::
:::: {.generated-output}
To count the words in a sentence, first split
the sentence into words, then count the number
of words in the list.

``` {.python #word-count}
def word_count(sentence):
    <<split-into-words>>
    <<count-words>>
    return count
```

The default arguments to the `.split` method
split on any white space.

``` {.python #split-into-words}
words = sentence.split()
```

Counting is done with the `len` function.

``` {.python #count-words}
count = len(words)
```
::::
:::

> “Talk is cheap. Show me the code.” [Linus Torvalds]()

<!--
#### Test your documentation
::: {.example}
:::: {.given-input}
~~~markdown
 Counting words, the zero-case:

 ``` {.python .eval #word-count}
 word_count("")
 ```

 And a small sentence:

 ``` {.python .doctest #word-count}
 word_count("Hebban olla uogala")
 ---
 4
 ```
~~~
::::
:::: {.generated-output}
Counting words, the zero-case:

``` {.python .eval #word-count}
word_count("")
```

And a small sentence:

``` {.python .doctest #word-count}
word_count("Hebban olla uogala")
---
4
```
::::
:::-->

# Documentation

- [Tutorial: setting up a Literate project](tutorial.html)
- [User Manual](manual.html)
- [Example gallery](https://entangled.github.io/examples)
- [Use MkDocs to publish](https://entangled.github.io/mkdocs-plugin)

## Bootstrap web template for Pandoc
To help you easily create a presentable website from your literate code, we provide a Bootstrap template for Pandoc. Probably the best way to use this template, is to fork [our repository at entangled/bootstrap-submodule](https://github.com/entangled/bootstrap-submodule), and add your fork as a submodule in your project:

        git submodule add git@github.com:<my bootstrap-submodule fork>

This way you can tweak the template to your own wishes. If you want to play around first, you can also use the cookiecutter template,

        cookiecutter https://github.com/entangled/bootstrap

but this approach is less flexible. For more information, see [the tutorial](tutorial.html).

# External Links {#section-links}

### Blogs

- [Why all you'll ever need is Markdown](https://blog.esciencecenter.nl/why-all-youll-ever-need-is-markdown-dc604f0ab309) --- Introduction to Pandoc, and Pandoc filters.
- [Entangled, a bi-directional Literate Programming tool](https://blog.esciencecenter.nl/entangled-1744448f4b9f) --- Presenting Entangled, a tool for pain free literate programming.
- [Literate Programming in Science: the why](https://blog.esciencecenter.nl/literate-programming-in-science-1669094541a7) --- Explaining why Literate Programming is particularly well matched with scientific programming.
- [Literate Programming in Science: the how](https://blog.esciencecenter.nl/literate-programming-in-science-ed94dcc8f758) --- Showing methods for Literate Programming, comparing Entangled to Jupyter, RMarkdown and Org-mode.
- [Unweaving legacy code using Entangled](https://blog.esciencecenter.nl/unweaving-legacy-code-using-entangled-2e6380a88b2f) --- Showing how you can use Entangled to reverse-engineer unreadable legacy code.

### Literate Books
These are some awesome books written with a literate philosophy in mind.

``` {.markdown .bootstrap-card-deck}
---
title: "Pharr, Jakob & Humphreys - Physically Based Rendering"
link: "[PBRT](https://www.pbrt.org/)"
image: img/pbrt.png
imageLocation: left
---
Explains physically realistic 3D rendering, while implementing the same techniques in C++. This book is so amazing, it actually won an Acadamy Award for technical achievement. The book uses the same *noweb* notation for code block references we do.
```

``` {.markdown .bootstrap-card-deck}
---
title: "Sussman & Wisdom - Structure and Interpretation of Classical Mechanics"
link: "[SICM](https://mitpress.mit.edu/books/structure-and-interpretation-classical-mechanics-second-edition)"
image: img/sicm.jpg             
imageLocation: left
---
Does not use *noweb*, but subscribes to the many founding
principles of literate programming. This is a text book on classical mechanics
and specifically the Lagrangian and Hamiltonian descriptions of physics.
```

``` {.markdown .bootstrap-card-deck}
---
title: "Hudak & Quick - The Haskell School of Music"
link: "[HSOM](http://euterpea.com/haskell-school-of-music/)"
image: img/hsom.jpg
imageLocation: left
---
From signals to symphonies, this book fuses the authors' passion for music and the Haskell programming language.
```


### Pandoc filters

- [Knitty](https://github.com/kiwi0fruit/knitty) --- Expands code-cells through a Jupyter interface. Uses Panflute. 
- [pandocsql](https://github.com/alexpdp7/pandocsql) --- Inserts tables in your markdown into an Sqlite database, and run queries that appear as tables in the output. Uses Panflute.

### Dev tools

- [Panflute](https://github.com/sergiocorreia/panflute) --- A "Pythonic" interface for creating Pandoc filters.

