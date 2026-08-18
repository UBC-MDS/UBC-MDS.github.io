---
layout: page
title: Ubuntu
subtitle: MDS software stack install instructions for Ubuntu 2026/27
---

## Table of Contents

- [Installation notes](#installation-notes)
- [UBC Student Email](#ubc-student-email)
- [Ubuntu software settings](#ubuntu-software-settings)
- [Web browser](#web-browser)
- [Password manager](#password-manager)
- [Slack](#slack)
- [UBC cloud computing resources](#ubc-cloud-computing-resources)
- [Positron](#positron)
- [GitHub](#github)
- [Git](#git)
- [Quarto CLI](#quarto-cli)
- [Pandoc](#pandoc)
- [Python and uv](#python-and-uv)
- [R and RStudio](#r-and-rstudio)
- [LaTeX and PDF export](#latex-and-pdf-export)
- [PostgreSQL](#postgresql)
- [Docker](#docker)
- [Improving the bash configuration](#improving-the-bash-configuration)
- [Post-installation notes](#post-installation-notes)
- [Visual Studio Code (optional)](#visual-studio-code-optional)
- [Attributions](#attributions)

## Installation notes

These instructions were written for **Ubuntu 24.04 LTS**, which is the release we recommend.
They also work on Ubuntu 26.04 LTS, with the small differences noted in the relevant sections below.

If you have already installed Git, Latex, or any of the R or Python related packages
**please uninstall these and follow the instructions below to reinstall them**
(make sure to also remove any user configuration files and backup them if desired).
In order to be able to support you effectively
and minimize setup issues and software conflicts,
we require all students to install the software stack the same way.

For Python in particular there is a script that reports everything already installed
on your machine, so you do not have to hunt for it yourself.
You will run it as part of the
[Python and uv](#python-and-uv) section below.

In all the sections below,
download the 64-bit version of the application
(usually labelled `x86_64` or `amd64`).

Once you have completed these installation instructions,
make sure to follow the post-installation notes at the end
to check that all software is setup correctly.

## UBC Student Email

Please sign up for a UBC Student Email. This account will also grant you access to a range of UBC services, including Microsoft Teams and OneDrive. To do so navigate to [https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service](https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service) and follow the instructions under "Get Started".

## Ubuntu software settings

To ensure that you are installing the right version of the software in this guide,
the `main`, `universe`, `restricted`, and `multiverse` package repositories all need to be enabled.
This is the default configuration, so most likely you do not need to change anything.

On Ubuntu 24.04 you can check this by opening "Software & Updates"
and making sure that the boxes in the screenshot below are checked.

![](/resources_pages/imgs/ubuntu-software-settings.png)

> **Note:** Ubuntu 26.04 no longer ships the "Software & Updates" application on new installations.
> You can list which repositories are enabled from a terminal instead by running `apt-cache policy`,
> or install the old application with `sudo apt install software-properties-gtk`.

## Web browser

In MDS we will be using many tools that work most reliably on Google Chrome and Firefox (including our online quiz software), so we recommend that you use one of these browsers.

- Firefox comes preinstalled with Ubuntu, so there is no need to download anything.
- To install Chrome, go to [https://www.google.com/chrome/](https://www.google.com/chrome/), click on "Download Chrome" choose the deb-file, download it to your computer and click on the downloaded file to install it.

> **Note:** Download the deb-file first rather than choosing "open with". If App Center (which used to be called Ubuntu Software) refuses to install the file, you can install it from a terminal instead with `sudo apt install ./<name-of-the-file>.deb`.

## Password manager

A password manager is an efficient and convenient measure to protect your online accounts from most common threats. While you don't strictly need to use one for any of the courses in MDS, we **highly recommend** that you set one up for your own benefit. Examples of reliable password managers include the ones built into Chrome and Firefox, as well as [Bitwarden](https://bitwarden.com/), and [KeePassXC](https://keepassxc.org/) (if you prefer to sync your passwords manually).

## Slack

For MDS program announcements, course forums, and correspondence we use the communication tool Slack. Slack can be accessed via the web browser, but we recommend using the Slack app, which can be installed via the [Snap store/App Center through this link](https://snapcraft.io/slack) or via the downloadable deb-file from the slack website [https://slack.com/downloads/linux](https://slack.com/downloads/linux).

## UBC cloud computing resources

If you at any point during the MDS program are having an issue with your computer,
such as not being able to install all the software before the start of the program,
it is useful to know UBC offers a free online computing environment
that you can use as a backup to follow along in most of the MDS courses.
This is called Jupyter Open
and you can access it by logging into [https://open.jupyter.ubc.ca/](https://open.jupyter.ubc.ca/)
with your UBC CWL.
Jupyter Open allow you to work with JupyterLab, R, Python, and Bash,
and you can install packages there as well
(these are all explained further down in the installation instructions
and during the program).

## Positron

Positron is the code editor we will be using throughout the MDS program.
It is built specifically for data science
and has support for both Python and R built in,
including a console, a variables pane, and an editor for Jupyter notebooks.

Download the Linux **x64 .deb** package from [https://positron.posit.co/download.html](https://positron.posit.co/download.html).
Then install it from a terminal with `dpkg`,
replacing `<name-of-the-file>` with the file you actually downloaded:

```bash
sudo dpkg -i ~/Downloads/<name-of-the-file>.deb
sudo apt-get install -f
```

The second command installs any missing dependencies,
and does nothing if there are none.

> **Note:** Please use the two commands above rather than double-clicking the file
> or using a graphical installer such as `gdebi`,
> which reports a dependency error on recent versions of Ubuntu even though the package is fine.

**Restart** the terminal and check that it worked:

```bash
positron --version
```

You should see something like this if you were successful
(the exact versions and hash will differ):

```
Positron: 2026.08.0 build 331
Positron SHA: a3a370d4187484ce962794408c76dab702978eaf
Code OSS: 1.124.0
Arch: x64
```

> **Note:** If you get `positron: command not found`,
> see [the Positron documentation on adding it to your path](https://positron.posit.co/add-to-path.html).

> **Note:** You do not need to install any extensions for Python, R, or Quarto.
> Positron already includes support for all three.

> **Note:** The first time you open Positron it may tell you that no interpreters were found.
> That is expected at this stage — we install Python and R further down these instructions.
> Once they are installed, Positron finds R automatically,
> and it finds Python by looking for a `.venv` folder inside whichever project folder you open.

> **Note:** On Ubuntu, Positron notifies you about updates but does not install them for you.
> When you are told a new version is available, download the new `.deb` and install it the same way.

## GitHub

In MDS we will use the publicly available [GitHub.com](https://github.com/) as well as an Enterprise version of GitHub hosted here at UBC, [GitHub.ubc.ca](https://github.ubc.ca). Please follow the set-up instructions for both below.

> **Important:** These are two completely separate GitHub instances.
> They have separate accounts, separate usernames, and separate repositories,
> and signing in to one does not sign you in to the other.
>
> - **GitHub.ubc.ca** is UBC's own installation. Your account there is created for you
>   and you sign in with your UBC CWL, so there is no username for you to choose.
> - **GitHub.com** is the public one. It is your professional profile,
>   and it stays with you after the program ends.

#### GitHub.com

Sign up for a free account at [GitHub.com](https://github.com/) if you don't have one already.

If you *do* already have a GitHub.com account, use that same account for MDS.
We recommend **not** creating a new one just for the program,
since this is the account that builds up your public work over time.

#### GitHub.ubc.ca

To add you to the MDS organization on [Github.ubc.ca](https://github.ubc.ca) we need you to follow the instructions below:

1. navigate to [https://activate.github.ubc.ca](https://activate.github.ubc.ca) and login with your CWL to setup their access
2. **wait 20 minutes**
3. login to [Github.ubc.ca](https://github.ubc.ca) using your CWL credentials

This step is required for
- being able to store your work
- all homework submission and grading
- working collaboratively

## Git

We will be using the command line version of Git as well as Git through RStudio and JupyterLab. Some of the Git commands we will use are only available since Git 2.23, so if your Git is older than this version, we ask you to update it using the following command:

```bash
sudo apt update
sudo apt install git curl make
```

`curl` and `make` are installed here as well. Ubuntu Desktop does not ship `curl` — it
ships `wget` — and several later steps, including the one that installs `uv` and the
setup check itself, are `curl` commands. Without it those commands print one line to the
terminal, do nothing, and report success, which is a confusing way to discover a missing
program. `make` is used from the second week of the program onwards.

You can check your git version with the following command:

```bash
git --version
```

you should see something like this if you were successful:

```
git version 2.43.0
```

### Configuring Git user info

Next, we need to configure Git by telling it your name and email. To do this type the following into the terminal (replacing Jane Doe and janedoe@example.com, with your name and email (the same you used on GitHub), respectively):

```bash
git config --global user.name "Jane Doe"
git config --global user.email janedoe@example.com
```

> **Note:** To ensure that you haven't made a typo in any of the above, you can view your global Git configurations by either opening the configuration file in a text editor (e.g. via the command `positron ~/.gitconfig`) or by typing `git config --list --global`.

### Setting Positron as the default editor

To make programs run from the terminal (such as `git`) use Positron by default, we will modify the bash configuration file `~/.bashrc`. First, open it using Positron:

```bash
positron ~/.bashrc
```

> **Note:** If you see any existing lines in your `~/.bashrc`
> related to a previous Python or R installation,
> please remove these.

Append the following lines to the file:

```
# Set the default editor for programs launched from the terminal
export EDITOR="positron --wait"
export VISUAL="$EDITOR"  # Use the same value as for "EDITOR" in the line above
```

Then save the file and close the Positron window.

> **Note:** Most terminal programs will read the `EDITOR` environmental variable when determining which editor to use, but some read `VISUAL`, so we're setting both to the same value.

In some cases,
Positron is not set as the default text editor for git
even after appending the two lines above,
so to make sure it is registered properly,
also run the following from your terminal:

```bash
git config --global core.editor "positron --wait"
```

## Quarto CLI

Quarto is an open-source scientific and technical publishing system.
In MDS it is how you will turn notebooks and reports into PDF and HTML documents,
and you can use it from Positron, JupyterLab, RStudio, or the terminal.

Download the [latest version of Quarto CLI](https://quarto.org/docs/get-started/) for Linux
and install the downloaded `.deb` file.

> **Note:** RStudio, which we install further down these instructions,
> comes with its own bundled copy of Quarto.
> That copy is not necessarily the most recent release,
> which is why we install the Quarto CLI separately here.

After the installation finishes,
close all the terminals you may have open, then open a new one and run:

```bash
quarto --version
```

You should see something like this if you were successful
(the exact version will differ):

```
1.10.3
```

## Pandoc

[Pandoc](https://pandoc.org/) is the program that converts documents from one format
into another. JupyterLab and R Markdown both call it when they export to PDF,
so it has to be installed and on your `PATH`.

> **Note:** Quarto ships with its own private copy of pandoc and does not need this one.
> This install is for the other two export routes.

Go to the [pandoc installation page](https://pandoc.org/installing.html)
and download the `.deb` package that matches your machine,
`amd64` for an Intel or AMD processor and `arm64` for an ARM one.
If you are unsure, run `uname -m` in a terminal:
it prints `x86_64` for `amd64`, and `aarch64` for `arm64`.

Install it the same way you installed Positron:

```bash
sudo dpkg -i ~/Downloads/<name-of-the-file>.deb
sudo apt-get install -f
```

The package installs `pandoc` into `/usr/bin`, which is already on your `PATH`,
so there is nothing to add to your bash configuration file.

Open a new terminal and check that it worked:

```bash
pandoc --version
```

You should see something like this, with a version of 3.10 or newer:

```
pandoc 3.10.2
Features: +server +lua
```

> **Note:** RStudio and Positron each bundle a copy of pandoc as well,
> so you may end up with more than one on your computer.
> That is expected and harmless.
> The one you just installed is the one your terminal will use.

---

## Python and uv

> **Note:** Earlier versions of these instructions used Miniforge and `conda`.
> If you find MDS material anywhere that tells you to run `conda install`,
> it is out of date — ignore it.

### Checking for Python installations you already have

Ubuntu comes with Python, and many people add more copies of it
from a previous course or from teaching themselves.
Those copies can get in each other's way,
so before installing anything new it is worth seeing what is already there.

Run the following in a terminal:

```bash
bash <(curl -Ssf https://ubc-mds.github.io/mds-setup-check/check-python-installs.sh)
```

This only looks and reports — it does not change or remove anything.
It prints what it finds in up to three groups:
things it recommends removing (conda installations — MDS has moved off conda entirely),
things likely to cause confusion later that you can safely leave alone,
and things worth fixing regardless.
If nothing needs your attention, it says so and prints nothing else.
Where it suggests a clean-up, it gives you the exact command to run yourself.

> **Note:** This report is informational.
> uv will work even if you change nothing at all.
> If you are not sure about an item, leave it and bring the output to a TA.
> **Never remove `/usr/bin/python3` or anything else inside `/usr/bin`.**
> Ubuntu's own package manager is written in Python and depends on it;
> removing it will break your system.

### Installing uv

Install uv by running this in a terminal:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

The installer adds uv to your `PATH` by editing your `~/.bashrc`,
so **close all open terminals and open a new one** before continuing.
Then check that it worked:

```bash
uv --version
```

You should see something like this if you were successful:

```
uv 0.12.3
```

> **Note:** If you get `bash: uv: command not found` in a brand new terminal,
> your bash configuration file is not being read.
> You can get going again in the current terminal by running
> `source $HOME/.local/bin/env`,
> but the underlying problem is worth fixing —
> revisit the [Setting Positron as the default editor](#setting-positron-as-the-default-editor)
> section above, which is where `~/.bashrc` is first edited.

### Installing Python

Now use uv to install the version of Python that MDS starts with:

```bash
uv python install 3.14
```

This does **not** give you a command called `python`. That is intentional.
Try it and see:

```bash
python --version
```

```
bash: python: command not found
```

That is the correct answer.
There are still a couple of Python programs on your machine —
`python3`, which belongs to Ubuntu, and `python3.14`, which uv just installed —
but **neither of them has pandas or any other MDS package in it**.
The packages live inside projects, and `uv run` is how you reach them.

> **Note:** `/usr/bin/python3` belongs to Ubuntu, which uses it for its own
> software, including the package manager. Leave it alone.
> You will never need to install anything into it.

### JupyterLab

JupyterLab is the other coding environment we use in MDS,
and there is nothing to install for it here.
Like every other Python package it comes with the project you are working in,
so you will start it with `uv run jupyter lab` from inside an assignment folder.

## R and RStudio

R is another programming language that we will be using a lot in the MDS program. We will use R in RStudio and in Positron.

> **Note:** R is not managed by uv. uv looks after Python and Python packages only;
> R packages are installed with R's own `install.packages()` and live in your R library.
> The two ecosystems stay separate, and that is deliberate —
> you do not need a project or a `uv run` prefix to use R.

### R

The version of R available in the default Ubuntu repositories is older than the one we use in MDS. To obtain the latest R packages, we need to add a new repository which is maintained directly by the r-project. To do this, first add the key for this repository by typing the following:

```bash
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
```

Then add the URL to the repository:

```bash
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```

Next, install `r-base` and `r-base-dev` (useful for compiling R packages from source):

```bash
sudo apt install r-base r-base-dev
```

After installation, type the following in a new terminal window:
```bash
R --version
```

You should see something like this if you were successful:

```
R version 4.6.1 (2026-06-24) -- "Happy Hop"
Copyright (C) 2026 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```

> **Note:** [See this page for additional instructions if you run into troubles while installing R](https://cloud.r-project.org/bin/linux/ubuntu/).

> **Note:** Install R from CRAN as described above, and not through conda or a
> language version manager. Those builds are put together differently
> and regularly cause problems when installing R packages later on.

### RStudio

Download RStudio Desktop (not Pro) from [the Posit downloads page](https://docs.posit.co/ide/user/#rstudio-ide-oss-downloads). Under "Direct Downloads (Open Source)", pick the `.deb` file labelled "Ubuntu 22 / 24, Debian 12 / 13" — this is also the correct package for Ubuntu 26.04. Open the file and follow the installer instructions.

> **Note:** If App Center refuses to open the downloaded `.deb` file, you can install it from a terminal instead with `sudo apt install ./<name-of-the-file>.deb`.

To see if you were successful, try opening RStudio by clicking on its icon or typing `rstudio` in a terminal. It should open and look something like this picture below:

![](/resources_pages/imgs/RStudio-ubuntu.png)

> **Note:** Since we installed RStudio directly from a deb file rather than from a repository or a snap package, it will not be updated when we run `sudo apt upgrade` and not automatically as for snap packages. Instead, RStudio will notify you of any available updates when the program is launched.

Now we are going to change RStudio’s *Insert Pipe* shortcut so that it inserts the [native pipe operator `|>`](https://posit.co/blog/rstudio-v1-4-update-whats-new).
Go to `Tools > Global Options > Code > Editing` and tick the following option:

![](/resources_pages/imgs/new-pipe-rstudio.png)

Once the change is made you can try in the RStudio console `Ctrl` + `Shift` + `m` to check if works. Close down RStudio afterwards.

### Installing R packages

Some R packages (e.g. `tidyverse` and `devtools`) have external dependencies on Ubuntu outside of R. We need to install these first before we install such R packages:

```bash
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libtiff-dev libgit2-dev libuv1-dev
```

Next, install the key R packages needed for the start of MDS program,
by opening up RStudio again and
typing the following into the R console inside RStudio
(the first line might take a long time to run):


> **Note:** If you are asked about installing into a personal library, select Yes.

> **Note:** If you are asked to select a mirror, select the first `0-Cloud` mirror.

```R
install.packages('pak')
pak::pkg_install(c('tidyverse', 'renv', 'usethis', 'devtools', 'markdown', 'rmarkdown', 'languageserver', 'janitor', 'gapminder', 'readxl', "ucbds-infra/ottr", "ttimbers/canlang"))
```

> **Note:** If you are asked to update packages during the installation, select the `None` option.

### Stan

Stan is the language we will be using later on in the program for Bayesian statistics.
To install it open RStudio and install `rstan`

```R
install.packages("StanHeaders", repos = c("https://stan-dev.r-universe.dev", getOption("repos")))
install.packages("rstan", repos = c("https://stan-dev.r-universe.dev", getOption("repos")))
```

> **Note:** If you are asked to update packages during the installation, select the `None` option.

Test the installation with:

```r
example(stan_model, package = "rstan", run.dontrun = TRUE)
```

The model should then compile and sample.
Here's a snippet of the output you should see:

```
SAMPLING FOR MODEL '16a540c6086086816528e4524def24d9' NOW (CHAIN 4).
Chain 4:
Chain 4: Gradient evaluation took 2e-06 seconds
Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.02 seconds.
Chain 4: Adjust your expectations accordingly!
Chain 4:
Chain 4:
Chain 4: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 4: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 4: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 4: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 4: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 4: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 4: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 4: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 4: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 4: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 4: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 4:
Chain 4:  Elapsed Time: 0.003828 seconds (Warm-up)
Chain 4:                0.003417 seconds (Sampling)
Chain 4:                0.007245 seconds (Total)
Chain 4:
```

> **Note:** If this step does not work, that is okay.
> It will not hold up the start of the program.
> Stan is not needed until block 5,
> so let your DSCI 521 instructor know that it failed
> and we will work on getting it going with you before then.

## LaTeX and PDF export

We will install the lightest possible version of LaTeX and it's necessary packages as possible so that we can render Jupyter notebooks and R Markdown documents to html and PDF. If you have previously installed LaTeX, please uninstall it before proceeding with these instructions.

First, open RStudio and run the following commands to install the `tinytex` package and setup `tinytex`:

```R
install.packages('tinytex')
tinytex::install_tinytex()
```

As recommended at the end of the installation,
it is important to **log out and in again for TinyTex to work properly**
(**restarting** the computer also works).
Once you log back in,
try running the following in a terminal:

```bash
latex --version
```

You should see something like this if you were successful:

```
pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)
kpathsea version 6.4.2
Copyright 2026 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.55; using libpng 1.6.55
Compiled with zlib 1.3.2; using zlib 1.3.2
Compiled with xpdf version 4.06
```

The above is all we need to have LaTeX work with R Markdown documents, however for Jupyter we need to install several more packages.
To install the additional LaTeX packages needed for Jupyter
paste the following into the new terminal instance and press enter:

```bash
tlmgr install eurosym \
  adjustbox \
  caption \
  collectbox \
  enumitem \
  environ \
  fp \
  jknapltx \
  parskip \
  pdfcol \
  pgf \
  rsfs \
  soul \
  tcolorbox \
  titling \
  trimspaces \
  ucs \
  ulem \
  upquote \
  lwarp \
  oberdiek \
  atkinson
```

> **Note:** `atkinson` is the [Atkinson Hyperlegible](https://www.brailleinstitute.org/freefont/)
> typeface, from the Braille Institute. It is designed so that characters which
> usually look alike do not — `I l 1`, `O 0`, `rn` and `m` — which is worth having
> in a program where you read code and output all day. It is installed here so
> that a document can ask for it; nothing requires you to use it.
>
> If you would also like it in your editor, both families are on Google Fonts
> ([Next](https://fonts.google.com/specimen/Atkinson+Hyperlegible+Next) for text,
> [Mono](https://fonts.google.com/specimen/Atkinson+Hyperlegible+Mono) for code)
> and install like any other font. That is entirely optional and separate from the
> package above.
>
> `mds-setup-check` carries [a short guide](https://github.com/UBC-MDS/mds-setup-check/blob/main/using-atkinson-hyperlegible.md)
> with the YAML to copy into a document, for both HTML and PDF.

### Which PDF route to use

You now have more than one way to turn a document into a PDF, and **they do not
all handle the same characters.** This is a property of the tools, not of your
installation:

| | accents, dashes, `°` | maths, e.g. `$\alpha$` | literal `α`, `✅` |
| --- | --- | --- | --- |
| `quarto render report.qmd --to pdf` (LaTeX) | yes | yes | **no — silently deleted** |
| `quarto render report.qmd --to typst` | yes | yes | yes |
| `quarto render report.qmd --to html` | yes | yes | yes |

**LaTeX drops literal Greek letters and emoji without warning and still reports
success**, so the PDF opens normally with the characters simply missing. Two habits
avoid this entirely:

- **Write Greek as maths.** `$\alpha$`, `$\beta$`, `$\sigma^2$` — never a literal
  `α`, `β`, `σ²`. Maths is set from a different font, so it renders in *every*
  route, and it is the correct way to write it in a statistics program anyway.
- **If a document really needs emoji, render it with Typst.** Typst ships inside
  Quarto and needs no LaTeX at all: `quarto render report.qmd --to typst`.

Two more things that fail silently, both worth knowing before your first lab:

- **Write multi-line equations as `$$\begin{aligned} ... \end{aligned}$$`.** A bare
  `\begin{align}` or `\begin{equation}` is raw LaTeX that Typst never sees, so it
  renders **nothing at all** — no error, and easy to miss in a long document.
- **If you write R Markdown, set the LaTeX engine.** R Markdown defaults to
  `pdflatex`, which cannot typeset accented characters, degree signs or proper
  dashes, and fails with an error that names a font rather than the engine. Every
  `.Rmd` you knit to PDF should have this in its header:

  ```yaml
  ---
  output:
    pdf_document:
      latex_engine: xelatex
  ---
  ```

  Rendering the same file with `quarto render report.Rmd --to pdf` does not need
  this — Quarto already uses a Unicode-capable engine.

## PostgreSQL

We will be using PostgreSQL as our database management system.
Install it via the following command:

```bash
sudo apt install postgresql
```

> Note: Ubuntu installs whichever major version its release carries — PostgreSQL 16 on
> Ubuntu 24.04 and PostgreSQL 18 on Ubuntu 26.04. That is expected, and the setup check
> accepts 16, 17 or 18. The macOS and Windows guides ask for 17 because those installers
> let you choose; here you take what the distribution gives you.
>
> Note: Older version of Ubuntu might not have the latest version of PostgreSQL in the repos.
> If this is the case for your version
> you need to follow the instructions in the PostgreSQL documentation
> to [first add the their repository
> and then install the latest version](https://www.postgresql.org/download/linux/ubuntu/).

By default, this installation creates a new user called `postgres`,
which is the only one with permission to open the databases.
We will see how to set this up for other users later in the program,
but for now run the following to confirm that your installation was successful:

```bash
sudo su -c psql postgres
```

The above should yield the prompt to change to what is shown below.
The major version depends on which Ubuntu release you are using
(PostgreSQL 16 on Ubuntu 24.04 and PostgreSQL 18 on Ubuntu 26.04),
and the exact minor version does not matter:

```
psql (16.9 (Ubuntu 16.9-0ubuntu0.24.04.1))
Type "help" for help.

postgres=#
```

> **Note:** To exit from Postgres type `exit`, or press `ctrl` + `d`.

## Docker

You will use Docker to create reproducible, sharable and shippable computing environments for your analyses. For this you will need a Docker account, which you can [sign up for free here](https://app.docker.com/signup).

You also need to install Docker Engine for Ubuntu. Follow the ["Install using the `apt` repository" instructions found here](https://docs.docker.com/engine/install/ubuntu/#install-using-the-apt-repository), working through both the "Set up Docker's `apt` repository" and the "Install the Docker packages" steps.

Next, [follow the Linux post installation steps here](https://docs.docker.com/engine/install/linux-postinstall/) so that you can run Docker without typing `sudo`
(only the subheading "Managing docker as a non-root user").
Confirm that docker is working by following the verification instructions on that same page.

## Improving the bash configuration

To improve your experience using bash,
we recommend appending a few lines to the end of your bash configuration file.
These make it easier to use the TAB key for autocompletion
improves how bash handles the command history,
and the appearance of the terminal
(we will talk more about these topics during class).
It also adds colors to the terminal's text,
which can make it easier to navigate visually.
First,
run the following command to download a script
that always shows information about git in the terminal prompt:

```bash
curl -Sso ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

Then open the bash configuration file:

```bash
positron ~/.bashrc
```

Paste the following at the end of the file
(make sure not to overwrite any existing lines)
and save it afterwards:

```bash
# Load the git prompt script
source ~/.git-prompt.sh
# Show unstaged (*) and staged (+) changes in the prompt string
export GIT_PS1_SHOWDIRTYSTATE=1

# Color the prompt string and add git info
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

# TAB completion configuration
# TAB completion ignores case
bind "set completion-ignore-case on"
# Require only one instead of two TAB presses before showing matches
bind "set show-all-if-ambiguous on"
# If there are multiple matches for completion, cycle through them with TAB
bind 'TAB':menu-complete
# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# History configuration
# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Append to the history file, don't overwrite it.
shopt -s histappend
# Write commands to history one-by-one right after they are executed
# instead of all together when the terminal is closed.
# Make new terminals see all commands run in currently open terminals and
# prepend a newline to the prompt string to separate it from the last command's output
PROMPT_COMMAND='history -a; echo'
# Increase history size
HISTSIZE=50000
HISTFILESIZE=50000

# Aliases and functions
# Note that aliases only are in effect when you are using the shell interactively
# (e.g. opening the terminal and typing or pasting commands).
# If you run a bash script or makefile,
# the original command is used instead of your alias.
# ---
# MDS help script
alias mds-help='bash ~/.mds-help.sh'
# Some common operations
alias l='ls -lthAF'
alias jl='uv run jupyter lab'
alias gl='git log --date short -10 --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%ad%C(auto)%d %C(auto,reset)%s"'
alias gt='git status'
alias gm='git commit -m'
alias gap='git add -p'
# Move, remove, and copy show what was done and prompt before overwriting files.
alias rm="rm -vI"
alias mv="mv -vi"
alias cp="cp -vi"
alias mkdir="mkdir -vp"
# Case insensitive grep by default
alias grep='grep -i'
```

Finally, download and save the MDS help script via the following command.

```bash
curl -Ssfo ~/.mds-help.sh https://ubc-mds.github.io/mds-setup-check/mds-help.sh
```

Open a new terminal and type `mds-help`,
your terminal should display
the most important terminal commands we will be learning in MDS.
You don't need to memorize these now,
just remember that if you ever forget how to do something with `bash`, `git` or `uv`,
you can type `mds-help` in your terminal
and use it as a reference.

## Post-installation notes

You have completed the installation instructions, well done 🙌!
We have created a script to help you check that your installation was successful,
and to provide instructions for how you can troubleshoot any issues.
To run this script,
please execute the following command from your terminal.

```bash
bash <(curl -Ssf https://ubc-mds.github.io/mds-setup-check/check-setup-mds.sh)
```

The script checks the Python side of your installation from inside a small project
that we ship for the purpose,
so it will ask permission to download that project into your home folder
as `~/mds-setup-check`.
Answer `y`, and give it a few minutes on a good connection —
it downloads several hundred megabytes the first time.

> **Note:** The script always makes that folder itself
> and will not reuse one that is already there,
> because it can only vouch for a copy it downloaded.
> So if you run the script again after fixing something,
> it will ask whether to delete `~/mds-setup-check` and download a fresh copy.
> **Answering yes deletes that folder and everything in it**, so if you have saved
> any work of your own in there, answer no and move it somewhere else first.
> The answer defaults to no — a bare Enter keeps the folder and skips the Python
> and document export checks.
> Saying yes costs you very little:
> the downloads are cached, so setting it up a second time takes seconds.

You can delete the folder for good once you have submitted your setup-check log.

The output from running the script will look something like this:

````
# MDS setup check v2026.08.18

If a program or package is marked as MISSING,
this means that you are missing the required version of that program or package.
Either it is not installed at all or the wrong version is installed.
The required version is indicated with a number and an asterisk (*),
e.g. 4.* means that all versions starting with 4 are accepted (4.0.1, 4.2.5, etc).

The "Document export" section is the exception. It tries several different ways of
turning a document into a PDF, and you only need one of them to work, so lines
marked FAILED there are fine. What matters is the summary at the end of that
section, which says whether PDF export works at all.

You can run the following commands to find out which version
of a program or package is installed (if any):
```
name_of_program --version  # For system programs
cd ~/mds-setup-check && uv pip list  # For Python packages
R -q -e "as.data.frame(installed.packages()[,3])"  # For R packages
```

Checking program and package versions...

## Operating system
Operating System: Ubuntu 24.04.1 LTS
Architecture:     x86-64
Kernel:           Linux 6.6.87.2

## System programs
OK        psql 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
OK        rstudio 2026.08.0+187
OK        R 4.6.1 (2026-06-24) -- "Happy Hop"
OK        uv 0.12.3
OK        bash 5.2.21(1)-release (x86_64-pc-linux-gnu)
OK        git 2.43.0
OK        make 4.3
OK        latex 3.141592653-2.6-1.40.29 (TeX Live 2026)
OK        tlmgr revision 79491 (2026-06-27 19:40:15 +0200)
OK        docker 29.6.2, build dfc4efb
OK        positron 2026.08.0 build 331
OK        quarto 1.10.3
OK        pandoc 3.10.2

## Python packages
OK        Python 3.14.3
OK        otter-grader=7.0.0
OK        pandas=3.0.5
OK        nbconvert=7.17.1
OK        playwright=1.62.0
OK        jupyterlab=4.6.3
OK        jupyterlab-git=0.54.1
OK        jupyterlab-spellchecker=0.9.0
OK        jupytext=1.19.5
OK        ipykernel=7.3.0

## R packages
OK        tidyverse=2.0.0
OK        markdown=2.0
OK        rmarkdown=2.31
OK        renv=1.2.3
OK        tinytex=0.60
OK        janitor=2.2.1
OK        gapminder=1.0.1
OK        readxl=1.5.0
OK        ottr=1.5.2
OK        canlang=0.0.1

## Document export
You only need ONE of the PDF routes below to work.
A FAILED line here is not a problem by itself -- read the summary at the end.
OK        quarto Typst PDF-generation was successful.
OK        quarto LaTeX PDF-generation was successful.
OK        jupyterlab PDF-generation was successful.
OK        jupyterlab WebPDF-generation was successful.
OK        jupyterlab HTML-generation was successful.
OK        rmarkdown PDF-generation was successful.
OK        rmarkdown HTML-generation was successful.

OK        PDF export works. 5 of 5 routes succeeded,
          and one is all you need. Ignore any FAILED lines above.

## Environment
Not recorded. You were asked, and chose not to include them.

## Content of .bash_profile
...

## Content of .bashrc
...

## Python installations

### Python installations already on this computer (v2026.08.18)

This is a report only. Nothing below has been changed or removed.
uv will work even if you change nothing at all.

## Python and pip commands on your PATH
...

## What to do about it

  Nothing needs your attention. Carry on with the installation instructions.

The above output has been saved to the file /home/janedoe/check-setup-mds.log
together with system configuration details and any detailed error messages about PDF and HTML generation.
You can open this folder in your file browser by typing `xdg-open .` (without the surrounding backticks).
Before sharing the log file, review that there is no SENSITIVE INFORMATION such as passwords or access tokens in it.
````

As you can see at the end of the output,
a log file is saved in your current directory.
We might ask you to upload this file
if we need to troubleshoot your installation,
so that we can help you more effectively.
If any of your packages are marked as "MISSING"
you will need to figure out what is wrong and possibly reinstall them.
A "FAILED" line is different: it appears only in the "Document export" section,
where several ways of producing a PDF are tried and you only need one of them.
Read the summary at the end of that section rather than the individual lines --
if it says "PDF export works", there is nothing for you to fix.
Once all packages are marked as "OK"
we will ask you to submit this log file,
so that we can confirm that your installation was successful.
Details on where to submit will be provided later.

The script asks **two** questions while it runs.

1. Whether to set the check project up in your home folder — or, if you have run the
   script before and `~/mds-setup-check` is still there, whether to delete that folder
   and download a fresh copy. **Answer `y`.** Without it, the Python and document
   export checks are all skipped. (Answering yes to the second form deletes that
   folder and everything in it, so move out anything of your own first.)
2. Whether to include your environment variables in the log. **Answer no** (just press
   Enter) unless an instructor asks you to include them. Environment variables often hold
   API keys and access tokens, and you are about to send this log to us.

Copy the command above exactly as written, including the `<(` and `)`. If you run it as
`curl ... | bash` instead, the script has no terminal to ask you anything with, both
answers stay at their defaults, and it skips every Python and Quarto check.

> **Note:** In general you should be careful running scripts unless they come from a trusted source as in this case (just like how you should be careful when downloading and installing programs on your computer).

## Visual Studio Code (optional)

Positron is the editor we use in MDS, and it is all you need for the program.
Visual Studio Code (VS Code) is a more general-purpose editor
that some students and instructors like to keep around for work outside of data science,
so instructions for setting it up are collected here.
**Nothing in MDS requires it.**

You can install VS Code either via the [Snap store/App Center through this link](https://snapcraft.io/code)
or via the downloadable deb-file from the VS code website [https://code.visualstudio.com/download](https://code.visualstudio.com/download).
The getting started instructions are here: [https://code.visualstudio.com/docs/setup/linux](https://code.visualstudio.com/docs/setup/linux).

From within VS Code you can open the [Extension Marketplace (read more here)](https://code.visualstudio.com/docs/configure/extensions/extension-marketplace)
to browse and install extensions by clicking on the Extensions icon in the Activity Bar indicated in the figure below.

![](/resources_pages/imgs/vscode.png)

To install an extension, search for it in the search bar, click the extension you want, and then click "Install".
These are the ones that pair well with the rest of the MDS software stack:

- Python (everything Python: notebooks, debugging, linting, formatting, etc.)
- markdownlint (markdown linting and style checking extension)
- GitLens (powerful extension that extends VS Code's native git capabilities)
- Git History (intuitive view of your git history)
- Container Tools (easily use Docker from VS Code; this replaced the older extension that was called "Docker")
- Quarto (integrated render and preview for Quarto documents and [more](https://quarto.org/docs/tools/vscode.html))

> **Note:** The list above is for VS Code only.
> Do **not** install Microsoft's Python or R extensions into Positron:
> they are not compatible with it,
> and Positron already has its own Python and R support built in.

## Attributions

* [Harvard CS109](https://cs109.github.io/2015/)
* [UBC STAT 545](https://stat545.com/system-prep.html) licensed under the [CC BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/legalcode).
* [Software Carpentry](https://software-carpentry.org/)
