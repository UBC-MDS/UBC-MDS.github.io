---
layout: page
title: macOS
subtitle: MDS software stack install instructions for macOS 2026/27
---

## Table of Contents

- [Installation notes](#installation-notes)
- [UBC Student Email](#ubc-student-email)
- [Web browser](#web-browser)
- [Password manager](#password-manager)
- [Slack](#slack)
- [UBC cloud computing resources](#ubc-cloud-computing-resources)
- [Bash shell](#bash-shell)
- [Xcode command line tools](#xcode-command-line-tools)
- [Positron](#positron)
- [GitHub](#github)
- [Git](#git)
- [Quarto CLI](#quarto-cli)
- [Python and uv](#python-and-uv)
- [R, XQuartz, and RStudio](#r-xquartz-and-rstudio)
- [LaTeX and PDF export](#latex-and-pdf-export)
- [PostgreSQL](#postgresql)
- [Docker](#docker)
- [Improving the bash configuration](#improving-the-bash-configuration)
- [Post-installation notes](#post-installation-notes)
- [Visual Studio Code (optional)](#visual-studio-code-optional)
- [Attributions](#attributions)


> **Important**
> Nearly every Mac sold since 2020 uses an [Apple Silicon (M series) chip](https://support.apple.com/en-us/116943), and these instructions assume that is what you have.
> Wherever a download page offers you a choice, pick the version marked Apple Silicon, Mac M1-M4, `arm64`, or `aarch64`.
> If you have an older Intel Mac, choose the version marked Intel or `x86_64` instead.
> You can check which chip your Mac has under the Apple menu > "About This Mac".

## Installation notes

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

Once you have completed these installation instructions,
make sure to follow the post-installation notes at the end
to check that all software is setup correctly.

## UBC Student Email
Please sign up for a UBC Student Email. This account will also grant you access to a range of UBC services, including Microsoft Teams and OneDrive. To do so navigate to [https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service](https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service) and follow the instructions under "Get Started".

## Web browser

In MDS we will be using many tools that work most reliably on Google Chrome and Firefox (including our online quiz software), so we recommend that you use one of these browsers.

- To install Chrome, go to [https://www.google.com/chrome/](https://www.google.com/chrome/), click on "Download Chrome" and follow the instructions on the website to finish the installation.
- To install Firefox, go to [https://www.firefox.com/](https://www.firefox.com/en-US/), click on "Download Firefox" and follow the instructions on the website to finish the installation.

## Password manager

A password manager is an efficient and convenient measure to protect your online accounts from most common threats. While you don't strictly need to use one for any of the courses in MDS, we **highly recommend** that you set one up for your own benefit. Examples of reliable password managers include the ones built into Chrome and Firefox, as well as [Bitwarden](https://bitwarden.com/), and [KeePassXC](https://keepassxc.org/) (if you prefer to sync your passwords manually).

## Slack

For our MDS courses and program announcements, correspondence and course forums we use the communication tool Slack. Slack can be accessed via the web browser, however we strongly recommend installing the Slack App. The Slack app can be installed from the Mac App Store, or from the Slack website. Installation instructions from the Slack website install method are here: [https://slack.com/downloads/mac](https://slack.com/downloads/mac)

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

## Bash shell

macOS uses Zsh as the default shell in the Terminal, however, we aim to teach with the same shell across all three operating systems we support, which is the Bash shell. Thus, we ask that you change the default shell in your Terminal to Bash by opening the Terminal ([how to video](https://youtu.be/5AJbWEWwnbY)) and typing:

```shell
chsh -s /bin/bash
```

You will have to quit all instances of open Terminals and then **restart** the Terminal for this to take effect.

## Xcode command line tools

We will need Xcode command line tools (not full Xcode) to build some of our programs and bring us developer utilities we need.

Open Terminal and type the following command to install Xcode command line tools:

```bash
xcode-select --install
```

After installation, in terminal type the following to ask for the version:

```bash
xcode-select -v
```
Which should return something like `xcode-select version 2409`.

## Positron

Positron is the code editor we will be using throughout the MDS program.
It is built specifically for data science
and has support for both Python and R built in,
including a console, a variables pane, and an editor for Jupyter notebooks.

### Installing

Download the macOS version of Positron from [https://positron.posit.co/download.html](https://positron.posit.co/download.html),
picking the **Apple Silicon** build
(choose the Intel build only if you have an older Intel Mac).
Open the downloaded `.dmg` file
and drag the Positron application into your "Applications" folder.

> **Note:** If macOS tells you that *"Positron is damaged and can't be opened"*,
> the file is fine — this is a known macOS quarantine glitch.
> Run the following command in the terminal and then open Positron again:
>
> ```bash
> xattr -c /Applications/Positron.app
> ```

### Launching Positron from the terminal

Throughout these instructions we will open configuration files by typing `positron` in the terminal,
so we need to make that command available first.

Open Positron, then open the Command Palette with `Cmd` + `Shift` + `P`,
type `Install 'positron' command in PATH`, and press enter to run it.

Now **restart** the terminal and check that it worked:

```bash
positron --version
```

You should see something like this if you were successful
(the exact versions and hash will differ):

```
Positron: 2026.08.0 build 331
Positron SHA: a3a370d4187484ce962794408c76dab702978eaf
Code OSS: 1.124.0
Arch: arm64
```

> **Note:** If you get an error message such as `-bash: positron: command not found`,
> but you can see that the Positron application has been installed,
> then the command was not added to your path.
> Quit **all** open Terminal windows, open a new one, and try again.
> If it still does not work, see [the Positron documentation on adding it to your path](https://positron.posit.co/add-to-path.html).

> **Note:** You do not need to install any extensions for Python, R, or Quarto.
> Positron already includes support for all three.

> **Note:** The first time you open Positron it may tell you that no interpreters were found.
> That is expected at this stage — we install Python and R further down these instructions.
> Once they are installed, Positron finds R automatically,
> and it finds Python by looking for a `.venv` folder inside whichever project folder you open.

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

We will be using the command line version of Git as well as Git through RStudio and JupyterLab. 

**If you installed Xcode command line tools above you already should have a recent enough Git**

In terminal type the following to ask for the version:

```bash
git --version
```

you should see something like this (does not have to be the exact same version) if you were successful:

```
git version 2.50.1 (Apple Git-155)
```

> **Note:** If you run into trouble, please see that Install Git > macOS section from [Happy Git and GitHub for the useR](https://happygitwithr.com/install-git.html#macos) for additional help or strategies for Git installation.

### Configuring Git user info

Next, we need to configure Git by telling it your name and email. To do this type the following into the terminal (replacing Jane Doe and janedoe@example.com, with your name and email (the same used to sign up for GitHub), respectively):

```bash
git config --global user.name "Jane Doe"
git config --global user.email janedoe@example.com
```

> **Note:** To ensure that you haven't made a typo in any of the above, you can view your global Git configurations by either opening the configuration file in a text editor (e.g. via the command `positron ~/.gitconfig`) or by typing `git config --list --global`.

### Setting Positron as the default editor

To make programs run from the terminal (such as `git`) use Positron by default, we will modify `~/.bash_profile`. First, open it using Positron (this will also create the file if it doesn't already exist):

```bash
positron ~/.bash_profile
```

> **Note:** If you see any existing lines in your `~/.bash_profile`
> related to a previous Python or R installation,
> please remove these.

Now append the following lines to `~/.bash_profile`:

```bash
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

On macOS,
programs launched from the terminal sometimes read a different configuration file
than the one we just edited.
To avoid this,
open your `~/.bashrc` file:

```bash
positron ~/.bashrc
```

And append the following lines:

```bash
# Do NOT add anything to this file, use `~/.bash_profile` instead.
# The next line automatically loads your `~/.bash_profile`
# any time a program tries to read your `~/.bashrc` file.
if [ -f ~/.bash_profile ]; then . ~/.bash_profile; fi
```

The comment is a reminder to your future self
who might open up this file a few months from now =)

## Quarto CLI

Quarto is an open-source scientific and technical publishing system.
In MDS it is how you will turn notebooks and reports into PDF and HTML documents,
and you can use it from Positron, JupyterLab, RStudio, or the terminal.

Download the [latest version of Quarto CLI](https://quarto.org/docs/get-started/) for macOS
and follow the installer instructions.

> **Note:** RStudio, which we install further down these instructions,
> comes with its own bundled copy of Quarto.
> That copy is not necessarily the most recent release,
> which is why we install the Quarto CLI separately here.

After the installation finishes,
quit all open Terminal windows, then open a new one and run:

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
positron ~/.bash_profile
```

and append the following line:

```bash
# Let other programs (such as JupyterLab's PDF export) use the pandoc that comes with Quarto
export PATH="$PATH:/Applications/quarto/bin/tools/$(uname -m | sed 's/^arm64$/aarch64/')"
```

Save the file,
then quit all open Terminal windows, open a new one, and check that it worked:

```bash
pandoc --version
```

You should see something like this if you were successful:

```
pandoc 3.8.3
Features: +server +lua
```

> **Note:** If you get `bash: pandoc: command not found`,
> Quarto was installed somewhere other than `/Applications/quarto`.
> Run `quarto --paths` — the first line it prints is the folder that contains `tools`.
> Use that folder in the line above instead of `/Applications/quarto/bin`.

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

Many people arrive with Python already installed a few different ways,
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
> **Never delete anything inside `/usr/bin`** — macOS itself uses those files.

### Installing uv

Install uv by running this in a terminal:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

The installer adds uv to your `PATH` by editing your `~/.bash_profile`,
so **quit all open Terminal windows and open a new one** before continuing.
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
> section above, which is where `~/.bash_profile` gets created.

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
There are still a couple of Python programs on your Mac —
`python3`, which belongs to macOS, and `python3.14`, which uv just installed —
but **neither of them has pandas or any other MDS package in it**.
The packages live inside projects, and `uv run` is how you reach them.

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
/Users/janedoe/mds-setup-check
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
hit the small floppy disk in the top right (or `Cmd` + `s`)
to save the settings.
Here is a screenshot of what it looks like with the settings saved:

![](/resources_pages/imgs/r-jl-text-shortcuts.png)

To check that it worked,
open the `check-notebook.ipynb` notebook that came with the project,
click into a cell,
and press `Alt` + `-` or `Shift` + `Cmd` + `m`.
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
> `~/.local/bin/python3.14` and macOS's own `python3`.
> Do not pick those — they do not have the MDS packages in them.
> Always choose the one that mentions `.venv`.

> **Note:** You are already using a virtual environment — that is what `.venv` is.
> You will learn how they work in DSCI 521: Platforms for Data Science;
> until then `uv run` takes care of it for you.

## R, XQuartz, and RStudio

R is another programming language that we will be using a lot in the MDS program. We will use R in RStudio and in Positron.

> **Note:** R is not managed by uv. uv looks after Python and Python packages only;
> R packages are installed with R's own `install.packages()` and live in your R library.
> The two ecosystems stay separate, and that is deliberate —
> you do not need a project or a `uv run` prefix to use R.

### R

Go to [https://cran.r-project.org/bin/macosx/](https://cran.r-project.org/bin/macosx/) and download the latest version of R for Mac (4.6.1 at the time of writing). Open the file and follow the installer instructions. Pay attention to which file you download: install the `-arm64.pkg` file (e.g. `R-4.6.1-arm64.pkg`) if you are working with a Mac M1 or newer, and the `-x86_64.pkg` file (e.g. `R-4.6.1-x86_64.pkg`) if you are working on an Intel Mac.

After installation, open a new terminal window and type the following:

```bash
R --version
```

You should see something like this if you were successful:

```
R version 4.6.1 (2026-06-24) -- "Happy Hop"
Copyright (C) 2026 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20
```

> **Note:** Install R from CRAN as described above, and not through a package manager
> such as Homebrew, MacPorts, or conda. Those builds are put together differently
> and regularly cause problems when installing R packages later on.

### XQuartz

Some R packages rely on the dependency XQuartz which no longer ships with the Mac OS, thus we need to install it separately. Download it from here: [https://www.xquartz.org/](https://www.xquartz.org/) and follow the installation instructions.

### RStudio

Download RStudio Desktop (not Pro) from [the Posit downloads page](https://docs.posit.co/ide/user/#rstudio-ide-oss-downloads). Under "Direct Downloads (Open Source)", pick the macOS `.dmg` file (RStudio requires macOS 13 or newer). You have already installed R, so you only need RStudio itself here. Open the file and follow the installer instructions.

To see if you were successful, try opening RStudio by clicking on its icon (from Finder, Applications or Launchpad). It should open and look something like this picture below:

![](/resources_pages/imgs/RStudio.png)

Now we are going to change RStudio’s *Insert Pipe* shortcut so that it inserts the [native pipe operator `|>`](https://posit.co/blog/rstudio-v1-4-update-whats-new).
Go to `Tools > Global Options > Code > Editing` and tick the following option:

![](/resources_pages/imgs/new-pipe-rstudio.png)

Once the change is made you can try in the RStudio console `Ctrl` + `Shift` + `m` to check if works. Close down RStudio afterwards.

>For students that are having computer admin issues, please run this in the terminal ```sudo chown -R $(whoami) .config```

### Installing R packages

Next, install the key R packages needed for the start of MDS program,
by opening up RStudio and
typing the following into the R console inside RStudio.

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

Open RStudio and run the following commands to install the `tinytex` package and setup `tinytex`:

```R
install.packages('tinytex')
tinytex::install_tinytex()
```

> **Note:** You might be asked to enter your macOS password during the installation,
> so that TinyTeX can add itself to your `PATH`.

You can check that the installation is working by opening a terminal and asking for the version of latex:

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

The above is all we need to have LaTeX work with R Markdown documents, however for Jupyter we need to add several more packages. Do this by opening a terminal and copying the following there press enter:

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

> **Note:** `make` came with the Xcode command line tools you installed at the
> start of these instructions, so there is nothing extra to install.

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

We will be using PostgreSQL as our database management system. Download the latest **PostgreSQL 17** installer for macOS from [the EnterpriseDB download page](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). That page also lists newer major versions such as 18, but please install 17 so that everyone in the program is working with the same version. Follow the instructions for the installation. In the password page, type whatever password you want, **and make sure you save it using a password manager or similar so that you know what it is in November when the SQL course starts** (otherwise you will need to reinstall PostgreSQL). For all the other options, use the default. You do not need to run "StackBuilder" at the end of the installation (if you accidentally launch the StackBuilder, click "cancel", you don't need to check any boxes).

To test if the installation was successful, open the `SQL Shell` app from Spotlight search (`Cmd` + `Space`) or the Applications folder. You will be asked to setup your configuration:

- Accept the default value (the one within square brackets) for the first three values by pressing enter three times,
- Enter `postgres` as the default username and hit enter,
- Finally, type in the password that you set during installation and press enter one last time.

It should look like this if it is working correctly:

![](/resources_pages/imgs/psql-mac-2022-23.png)

If you are asked about stackbuilder, you can skip this for now.

## Docker

You will use Docker to create reproducible, sharable and shippable computing environments for your analyses. For this you will need a Docker account, which you can [sign up for free here](https://app.docker.com/signup).

Then go to [the Docker Desktop install instructions for Mac](https://docs.docker.com/desktop/setup/install/mac-install/) and click the button for "Docker Desktop for Mac with Apple silicon" or "Docker Desktop for Mac with Intel chip", depending on which kind of Mac you have. Then follow the installation instructions on that page.

To test if Docker is working, after installation open the Docker app by clicking on its icon (from Finder, Applications or Launchpad). Next open Terminal and type the following:

```bash
docker run hello-world
```

you should see something like this if you were successful:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:451ce787d12369c5df2a32c85e5a03d52cbcef6eb3586dd03075f3034f10adcd
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

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
positron ~/.bash_profile
```

Paste the following at the end of the file
(make sure not to overwrite any existing lines)
and save it afterwards:

```bash
# Silence default shell note when launching bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Load the git prompt script
source ~/.git-prompt.sh
# Show unstaged (*) and staged (+) changes in the prompt string
export GIT_PS1_SHOWDIRTYSTATE=1

# Color text so it is easier to distinguish elements from each other
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxxbaDecac
# Color the prompt string and add git info
export PS1='\[\033[01;32m\]\u@\h\[\033[01;35m\] \w\[\033[34m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

# TAB completion configuration
# TAB completion ignores case
bind "set completion-ignore-case on"
# Require only one instead of two TAB presses before showing matches
bind "set show-all-if-ambiguous on"
# Unfortunately the tab cycling does not work together with single tab match expansion on macOS
# since bash is too old, so I have commented out the option below,
# but feel free to remove the leading `#` if you want to test it out.
# If there are multiple matches for completion, cycle through them with TAB
# bind 'TAB':menu-complete

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
alias rm="rm -vi"
alias mv="mv -vi"
alias cp="cp -vi"
alias mkdir="mkdir -vp"
# Case insensitive grep by default
alias grep='grep -i'
```

Finally, download and save the MDS help script via the following command.

```bash
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
and to provide instructions for how you can troubleshoot any potential issues.
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
ProductName:	macOS
ProductVersion:	26.5.1
BuildVersion:	25F80

## System programs
OK        psql (PostgreSQL) 17.6
OK        rstudio 2026.08.0+187
OK        R 4.6.1 (2026-06-24) -- "Happy Hop"
OK        uv 0.12.3
OK        bash 3.2.57(1)-release (arm64-apple-darwin25)
OK        git 2.50.1 (Apple Git-155)
OK        make 3.81
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

The above output has been saved to the file /Users/janedoe/check-setup-mds.log
together with system configuration details and any detailed error messages about PDF and HTML generation.
You can open this folder in your file browser by typing `open .` (without the surrounding backticks).
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

You can download and install the macOS version of VS Code from
[https://code.visualstudio.com/download](https://code.visualstudio.com/download),
choosing the "Apple silicon" build.
Once the download is finished, click "Open with Archive utility",
and move the extracted VS Code application from "Downloads" to "Applications".
If you would also like to launch it from the terminal with the `code` command,
follow the ["Launch VS Code from the command line"](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) steps.

From within VS Code you can open the [Extension Marketplace (read more here)](https://code.visualstudio.com/docs/configure/extensions/extension-marketplace)
to browse and install extensions by clicking on the Extensions icon in the Activity Bar indicated in the figure below.

![](/resources_pages/imgs/vscode.png)

To install an extension, go to `View -> Extensions` or click the icon shown in the image above.
Then search for the extension you want and click "Install".
These are the ones that pair well with the rest of the MDS software stack:

- Python (everything Python: notebooks, debugging, linting, formatting, etc.)
- markdownlint (markdown linting and style checking extension)
- GitLens - Git supercharged (powerful extension that extends VS Code's native git capabilities)
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
