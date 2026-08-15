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

```
sudo apt update
sudo apt install git
```

You can check your git version with the following command:

```
git --version
```

you should see something like this if you were successful:

```
git version 2.43.0
```

### Configuring Git user info

Next, we need to configure Git by telling it your name and email. To do this type the following into the terminal (replacing Jane Doe and janedoe@example.com, with your name and email (the same you used on GitHub), respectively):

```
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

### Making Quarto's pandoc available

Quarto ships with its own copy of [pandoc](https://pandoc.org/),
the program that converts documents from one format into another.
JupyterLab and R Markdown both use pandoc when they export to PDF,
but they can only find it if it is on your `PATH`.
Rather than installing a second copy of pandoc,
we will point your `PATH` at the one Quarto already gave you.

Open your bash configuration file:

```bash
positron ~/.bashrc
```

and append the following line:

```bash
# Let other programs (such as JupyterLab's PDF export) use the pandoc that comes with Quarto
export PATH="$PATH:/opt/quarto/bin/tools/$(uname -m)"
```

Save the file,
then close all the terminals you may have open, open a new one, and check that it worked:

```bash
pandoc --version
```

You should see something like this if you were successful:

```
pandoc 3.8.3
Features: +server +lua
```

> **Note:** If you get `bash: pandoc: command not found`,
> Quarto was installed somewhere other than `/opt/quarto`.
> Run `quarto --paths` — the first line it prints is the folder that contains `tools`.
> Use that folder in the line above instead of `/opt/quarto/bin`.

## Python and uv

### How Python works in MDS

Before installing anything, here are three ideas that the rest of this section relies on.

1. **Python lives inside a project, not on your computer.**
   Every assignment you get in MDS is a folder that carries its own list of packages
   and its own private copy of Python.
   Nothing is installed once and shared by everything.
2. **You get to it by typing `uv run` first.**
   [uv](https://docs.astral.sh/uv/) is the tool that manages those folders.
   Writing `uv run python` or `uv run jupyter lab` tells uv
   "use the packages belonging to this project",
   which is why every Python command in MDS starts with `uv`.
3. **The folder you are standing in decides whether a command works.**
   `uv run` looks for the project in the folder you are currently in.
   Run it somewhere else and it will not find your packages.
   Whenever something in this section fails,
   the first thing to check is which folder your terminal is in.

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
bash <(curl -Ssf https://ubc-mds.github.io/resources_pages/check-python-installs.sh)
```

This only looks and reports — it does not change or remove anything.
It prints what it finds in three groups:
things that are expected and should be left alone,
things that are likely to cause confusion later,
and things worth fixing regardless.
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

### Setting up the MDS check project

To confirm everything works together, we will use a small project
that we have already prepared for you.
Clone it into your home folder:

```bash
cd ~
git clone https://github.com/UBC-MDS/mds-setup-check.git
cd mds-setup-check
```

Now install the packages it asks for:

```bash
cd ~/mds-setup-check
uv sync
```

This creates a folder called `.venv` inside the project and downloads
JupyterLab, pandas, Otter-Grader and everything else into it.
It downloads several hundred megabytes the first time,
so give it a few minutes on a good connection.

> **Note:** If the download is interrupted, just run `uv sync` again —
> uv keeps what it already downloaded and picks up where it left off.

You should see something like this at the end
(the list of packages will be much longer):

```
Using CPython 3.14.3
Creating virtual environment at: .venv
Resolved 137 packages in 28ms
Installed 135 packages in 674ms
 + ipykernel==7.3.0
 + jupyterlab==4.6.3
 + pandas==3.0.5
 ...
```

Check that the project's Python is the one you get:

```bash
cd ~/mds-setup-check
uv run python --version
```

```
Python 3.14.3
```

and that the project's packages came with it:

```bash
cd ~/mds-setup-check
uv run python -c "import pandas; print(pandas.__version__)"
```

```
3.0.5
```

The second command is the one that really proves it.
`uv run python --version` prints a version even when you are outside a project;
only the packages tell you that you are in the right place.

You can also look at what the project folder now holds:

```bash
cd ~/mds-setup-check
ls -a
```

```
.  ..  .git  .gitignore  .python-version  .Rprofile  .venv
check-notebook.ipynb  check-quarto.qmd  check-rmarkdown.Rmd
Makefile  pyproject.toml  README.md  renv  renv.lock  uv.lock
```

`pyproject.toml` is the list of Python packages the project wants,
`uv.lock` records the exact versions everyone in the cohort gets,
and `.venv` is where they were installed.
You will see these same three things in every MDS assignment.

`renv.lock` and `renv` are the equivalent for R packages,
and we will come back to them when we render documents further down.

> **Keep this folder.** The LaTeX, PDF and final setup-check steps
> further down these instructions all run from inside `~/mds-setup-check`,
> and the check script looks for it there.
> You can delete it once you have submitted your setup-check log.

#### When a command fails, check the folder first

uv looks for the project in the folder you are standing in.
If you are somewhere else, you will see one of these:

```
error: No `pyproject.toml` found in current directory or any parent directory
```

That is `uv sync` telling you there is no project here.

```
error: Failed to spawn: `jupyter`
```

That is `uv run` telling you it cannot find the program,
because the project that provides it is not here.

There is a third case, and it is the one to watch out for,
because it does not look like an error at all.
Outside a project, `uv run python` still starts *a* Python —
just one with none of your packages in it:

```bash
uv run python -c "import pandas"
```

```
ModuleNotFoundError: No module named 'pandas'
```

If you ever see `ModuleNotFoundError` for a package you know the assignment
uses, check which folder you are in before you check anything else.

You can always find out where you are with:

```bash
pwd
```

```
/home/janedoe/mds-setup-check
```

and get back with `cd ~/mds-setup-check`.
This is why every code block in this section begins by moving into the project.

### JupyterLab

JupyterLab is one of the two coding environments we use in MDS.
It was installed by `uv sync` above, along with the Jupytext package
and the JupyterLab git and spellchecker extensions,
which help you use notebooks together with Git and catch typos in your writing.

Start it from inside the project:

```bash
cd ~/mds-setup-check
uv run jupyter lab
```

A new tab should open in your default browser with the JupyterLab interface.

![](/resources_pages/imgs/jupyter_lab.PNG)

To exit out of JupyterLab you can click `File -> Shutdown`,
or go back to the terminal you launched it from and hold `Ctrl` while pressing `c` twice.

> **Note:** JupyterLab keeps running in the terminal you started it from,
> so that terminal will not accept new commands until you shut it down.
> If you need a terminal while JupyterLab is running, open a second one —
> and remember to `cd ~/mds-setup-check` in that one too.

#### Keyboard shortcuts for R operators

Later in the program you will write R inside JupyterLab,
so while you are here we will add keyboard shortcuts
for the common R operators `<-` and `|>`.

Go to `Settings -> Settings Editor`. Then click `JSON Settings Editor` in the top right corner and click on `Keyboard Shortcuts` in the navigation panel to the left.
You will see two panels,
the right-most "User Preferences" panel allows you to perform advanced modification
of keyboards shortcuts in JupyterLab.
It should be empty.
We're going to add two shortcuts
by pasting the following snippet into that empty panel.


```json
{
    "shortcuts":[
        {
            "command": "apputils:run-first-enabled",
            "selector": "body",
            "keys": ["Alt -"],
            "args": {
                "commands": [
                    "console:replace-selection",
                    "fileeditor:replace-selection",
                    "notebook:replace-selection",
                ],
                "args": {"text": "<- "}
            }
        },
        {
            "command": "apputils:run-first-enabled",
            "selector": "body",
            "keys": ["Accel Shift M"],
            "args": {
                "commands": [
                    "console:replace-selection",
                    "fileeditor:replace-selection",
                    "notebook:replace-selection",
                ],
                "args": {"text": "|> "}
            }
        }
    ]
}
```

After you have pasted this text,
hit the small floppy disk in the top right (or `Ctrl` + `s`)
to save the settings.
Here is a screenshot of what it looks like with the settings saved:

![](/resources_pages/imgs/r-jl-text-shortcuts.png)

To check that it worked,
open the `check-notebook.ipynb` notebook that came with the project,
click into a cell,
and press `Alt` + `-` or `Shift` + `Ctrl` + `m`.
The operator should be inserted for you.
These shortcuts are saved for your user account rather than for one project,
so they will still be there in every assignment you open from now on.

### Opening the project in Positron

Positron works with the same project folders as JupyterLab.
Open Positron, choose `File -> Open Folder...`,
and select `~/mds-setup-check`.

Positron should detect the `.venv` folder and offer that interpreter.
Check the interpreter shown in the top right corner of the window;
it should read `Python 3.14.3 (.venv)` or similar.

> **Note:** The interpreter picker will also list
> `~/.local/bin/python3.14` and Ubuntu's own `python3`.
> Do not pick those — they do not have the MDS packages in them.
> Always choose the one that mentions `.venv`.

> **Note:** You are already using a virtual environment — that is what `.venv` is.
> You will learn how they work in DSCI 521: Platforms for Data Science;
> until then `uv run` takes care of it for you.

## R and RStudio

R is another programming language that we will be using a lot in the MDS program. We will use R in RStudio and in Positron.

> **Note:** R is not managed by uv. uv looks after Python and Python packages only;
> R packages are installed with R's own `install.packages()` and live in your R library.
> The two ecosystems stay separate, and that is deliberate —
> you do not need a project or a `uv run` prefix to use R.

### R

The version of R available in the default Ubuntu repositories is older than the one we use in MDS. To obtain the latest R packages, we need to add a new repository which is maintained directly by the r-project. To do this, first add the key for this repository by typing the following:

```
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
```

Then add the URL to the repository:

```
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```

Next, install `r-base` and `r-base-dev` (useful for compiling R packages from source):

```
sudo apt install r-base r-base-dev
```

After installation, type the following in a new terminal window:
```
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

```
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libtiff-dev
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

```
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

```
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
  oberdiek
```

### Checking that you can produce PDFs

You will hand in work written three different ways in MDS —
Quarto documents, Jupyter notebooks, and R Markdown documents —
and each is turned into a PDF by a different program.
The project you cloned earlier contains one example of each,
so you can check all three at once:

```bash
cd ~/mds-setup-check
make
```

> **Note:** `make` came with the `r-base-dev` package you installed above.
> If you get `make: command not found`,
> install it with `sudo apt install build-essential`.

The first time you run this it also installs the R packages the project needs,
using `renv`, which does for R packages what `uv sync` did for Python packages.
They go into a `renv` folder inside the project rather than into your main
R library, so this project renders the same way for everybody.

After that, it renders the three documents in turn and stops at the first failure,
so if something is wrong you will see which one it was and why.
When it works you end up with three PDF files:

```
check-quarto.pdf      rendered by Quarto
check-notebook.pdf    rendered by Jupyter
check-rmarkdown.pdf   rendered by R Markdown
```

**Open all three.** Each one ends with a line of accented and Greek characters.
If those look right, your LaTeX installation has the fonts it needs
for the ones that turn up in real assignments.

The commands `make` ran for you are worth knowing individually,
because these are the ones you will use on your own work:

```bash
cd ~/mds-setup-check
uv run quarto render check-quarto.qmd --to pdf
uv run jupyter nbconvert check-notebook.ipynb --to pdf
Rscript -e 'renv::restore(prompt = FALSE)'
Rscript -e 'rmarkdown::render("check-rmarkdown.Rmd", output_format = "pdf_document")'
```

Quarto is the one to reach for first for anything you hand in:
it handles `.qmd`, `.ipynb` and `.Rmd` files alike.

Note the `uv run` in front of the first two, and its absence from the last two.
The Quarto and Jupyter commands need this project's Python,
and `uv run` is what gives it to them.
R is not managed by uv, so the R commands do not need it.
A Quarto document with no Python in it can also be rendered with a plain
`quarto render`.

You can delete the rendered files again with `make clean`.

#### Exporting from inside JupyterLab

You do not have to go to the terminal to make a PDF. Start JupyterLab:

```bash
cd ~/mds-setup-check
uv run jupyter lab
```

then open `check-notebook.ipynb`
and go to `File -> Save and Export Notebook As... -> PDF`.

#### WebPDF, when LaTeX will not cooperate

JupyterLab can also export to PDF without using LaTeX at all,
by printing the notebook the way a browser would.
The result looks like the HTML version of a notebook,
and it is a useful fallback when LaTeX objects to something in your document.
This needs a copy of Chromium, which you download once:

```bash
cd ~/mds-setup-check
uv run playwright install chromium
```

Then, with JupyterLab open on `check-notebook.ipynb`,
go to `File -> Save and Export Notebook As... -> WebPDF`.
From the terminal, the same thing is `make webpdf`.

## PostgreSQL

We will be using PostgreSQL as our database management system.
Install it via the following command:

```
sudo apt install postgresql
```

> Note: Older version of Ubuntu might not have the latest version of PostgreSQL in the repos.
> If this is the case for your version
> you need to follow the instructions in the PostgreSQL documentation
> to [first add the their repository
> and then install the latest version](https://www.postgresql.org/download/linux/ubuntu/).

By default, this installation creates a new user called `postgres`,
which is the only one with permission to open the databases.
We will see how to set this up for other users later in the program,
but for now run the following to confirm that your installation was successful:

```
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

```
curl -Ssfo ~/.mds-help.sh https://ubc-mds.github.io/resources_pages/mds-help.sh
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
bash <(curl -Ssf https://ubc-mds.github.io/resources_pages/check-setup-mds.sh)
```

The output from running the script will look something like this:

````
# MDS setup check 2026.2

If a program or package is marked as MISSING,
this means that you are missing the required version of that program or package.
Either it is not installed at all or the wrong version is installed.
The required version is indicated with a number and an asterisk (*),
e.g. 4.* means that all versions starting with 4 are accepted (4.0.1, 4.2.5, etc).

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
OK        psql (PostgreSQL) 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
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
OK        pandoc 3.8.3

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
OK        quarto PDF-generation was successful.
OK        jupyterlab PDF-generation was successful.
OK        jupyterlab WebPDF-generation was successful.
OK        jupyterlab HTML-generation was successful.

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
OK        rmarkdown PDF-generation was successful.
OK        rmarkdown HTML-generation was successful.

## Python installations

# Python installations already on this computer (2026.2)

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
Once all packages are marked as "OK"
we will ask you to submit this log file,
so that we can confirm that your installation was successful.
Details on where to submit will be provided later.

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
