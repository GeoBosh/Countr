# Countr Project #

This repo contains all the materials related to the *Countr* projects. 

### What is this Countr project? ###

The *Countr* project refers to :

* The *Countr* package source code.
* The jss paper source code (Sweave and org) + referee comments
* The computation paper written by Prof Baker and Tarak 
* The different references used (in pdf)
* Any other materials we find useful.

### Who do I talk to? ###

* This repo will be mantained by Tarak and Georgi
* We may give read access to other contributors but we should avoid having other
  people writing to it.
  
### NOTE ###

* We noticed some issues with recent versions of optimx on Windows


### NOTE 2019-05-27 ###

- The package was failing to install after the recent overhaul of the directory structure.
  Sorted this out (main reason was that .Rbuildignore was ignoring `docs/`).
  
- please *note* that directory `/inst/` is a standard R directory, which is included
  in the tarball. I don't see any reason to have stuff there that is not
  (although this could be arranged wiwth suitable entries in `.Rbuildignore`.
  
- Created `/Org` at the top level. This directory contains only developers' stuff
  that is not to be included in the tarball. To this end:

  - added /Org to .Rbuildignore, to prevent it from being included in the
    tarball of the package.

  - moved `inst/countr_org to /Org.

  - copied `inst/examples/` to /Org and restored its state from the CRAN tarball
    of Countr. (I wasn't sure if the additional subdirectory in `examples/` is
    needed.)

- renamed README.md to `README_devel.md`. It is better to have `README.md`
  available, since it is processed on CRAN and if we decide to create a pkgdown
  site, also by pkgdown.
