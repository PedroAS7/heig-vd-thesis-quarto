# HEIG-VD Bachelor thesis template for Quarto

This repository contains the base files needed to write a Bachelor thesis report using Quarto and a Typst template written by Github users [@sylvain-pasini](https://github.com/sylvain-pasini), [@samuelroland](https://github.com/samuelroland), and [@DACC4](https://github.com/DACC4).

The original template has been translated into English by Github user [@EnJiBe](https://github.com/EnJiBe).

The original Typst (and LaTeX) template can be found in [this repository](https://github.com/sylvain-pasini/HEIG-VD-templates-for-reports).

## Installing the extension

To install this extension in your Quarto project, use the following command:

```
quarto install extension PedroAS7/heig-vd-thesis-quarto
```

## Writing the abstract

In order to properly show the abstract section, you must install the [abstract-section](https://github.com/pandoc-ext/abstract-section) plugin using the following command:

```
quarto install extension pandoc-ext/abstract-section
```

After installing it, you can write the abstract section inside the `abstract.md` file. You must keep the `# Abstract` headline, as well as the separator at the end of the file.

## Appendices

In order to use appendices, a workaround must be used. You must not use the "appendices" field in your Quarto project's YAML file, but must instead treat your appendix files are actual chapters:

```yaml
book:
  chapters:
    - abstract.md
    - index.qmd
    
  # LIKE this:
    - appendices.md
  
  # NOT like this:
  appendices:
    - appendices.md
```

Moreover, the first file that contains appendices must start with the following block of code:

````quarto
```{=typst}
#counter(heading).update(1)
#set heading(numbering: "A1.a", supplement: [Appendix])
```

# Appendices
````

You can have a look at `abstract.md` and `_quarto.yml` to better understand how to use this.