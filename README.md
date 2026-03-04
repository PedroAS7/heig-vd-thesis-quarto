# HEIG-VD Bachelor thesis template for Quarto

This repository contains the base files needed to write a Bachelor thesis report using Quarto and a Typst template written by Github users [@sylvain-pasini](https://github.com/sylvain-pasini), [@samuelroland](https://github.com/samuelroland), and [@DACC4](https://github.com/DACC4).

The original template has been translated into English by Github user [@EnJiBe](https://github.com/EnJiBe).

The original Typst (and LaTeX) template can be found in [this repository](https://github.com/sylvain-pasini/HEIG-VD-templates-for-reports).

## Writing the abstract

In order to properly show the abstract section, you must install the [abstract-section](https://github.com/pandoc-ext/abstract-section) plugin using the following command:

```
quarto install extension pandoc-ext/abstract-section
```

After installing it, you can write the abstract section inside the `abstract.md` file. You must keep the `# Abstract` headline, as well as the separator at the end of the file.
