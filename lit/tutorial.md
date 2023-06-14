---
title: Entangled
subtitle: "tutorial: first steps with Entangled"
version: 1.0.0
footer: "[![](img/escience_white.png){style='height: 20pt'}](https://esciencecenter.nl/)"
license:  "[Apache 2](https://www.apache.org/licenses/LICENSE-2.0)"
github: "https://github.com/entangled/entangled.py/"
---

# Installing Entangled
Install Entangled by running

```bash
pip install entangled_cli[rich]
```

This will install Entangled in your global user environment for Python (or `base` if you use Conda). Since Entangled is a tool which you might use in many projects that are not related to Python it can make less sense to install Entangled in a virtual environment. If you do use Python in more places, it might be advisable to use a virtual environment, or even better, use poetry.

```bash
# assuming you did run `poetry init`
poetry add --group=dev entangled_cli[rich]
poetry shell
```

Now that you have Entangled installed, you need to choose a *document generator*. Depending on your needs we advise either [MkDocs](https://www.mkdocs.org/) or [Pandoc](https://www.pandoc.org). Nothing is stopping you from choosing another tool, as long as this tool supports the needed Markdown extensions.

# Setting up a project
## Using Cookiecutter
The Cookiecutter templates are being worked on at the moment. Please be patient.

## MkDocs
There is a dedicated plugin for using Entangled with MkDocs called `mkdocs-entangled-plugin`. You can install it using

```bash
pip install mkdocs mkdocs-material mkdocs-entangled-plugin
```

(or `poetry add --group=dev ...` if you prefer).

The documentation, including setup instructions, for MkDocs with Entangled can be found at [entangled.github.io/mkdocs-plugin](https://entangled.github.io/mkdocs-plugin).

## Pandoc
Pandoc can be a bit harder to setup than MkDocs, but once you get the hang of it, Pandoc is much easier to extend.
