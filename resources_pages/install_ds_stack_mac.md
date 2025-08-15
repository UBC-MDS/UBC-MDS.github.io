---
layout: page
title: macOS
subtitle: MDS software stack install instructions for macOS 2025/26
---

<!-- Open links in a new tab unless they have the `{:target="_self"}` attribute -->
<head>
    <base target="_blank">
</head>

## Table of Contents

- [Installation notes](#installation-notes){:target="_self"}
- [UBC Student Email](#ubc-student-email){:target="_self"}
- [Web browser](#web-browser){:target="_self"}
- [Password manager](#password-manager){:target="_self"}
- [Slack](#slack){:target="_self"}
- [Bash shell](#bash-shell){:target="_self"}
- [Visual Studio Code](#visual-studio-code){:target="_self"}
- [GitHub](#github){:target="_self"}
- [Git](#git){:target="_self"}
- [Python, Conda, and JupyterLab](#python-conda-and-jupyterlab){:target="_self"}
- [R, XQuartz, IRkernel, and RStudio](#r-xquartz-irkernel-and-rstudio){:target="_self"}
- [Quarto CLI](#quarto-cli){:target="_self"}
- [LaTeX](#latex){:target="_self"}
- [PostgreSQL](#postgresql){:target="_self"}
- [Docker](#docker){:target="_self"}
- [VS Code extensions](#vs-code-extensions){:target="_self"}
- [Improving the bash configuration](#improving-the-bash-configuration){:target="_self"}
- [Post-installation notes](#post-installation-notes){:target="_self"}


> **Important**
> Note that there are differences in some parts of the installation for Mac computers with [recent Apple Silicon (Mac M1-M4) and earlier Intel chips](https://support.apple.com/en-us/116943). If you have a newer Mac laptop, make sure to chose relevant versions (usually denoted as Apple Silicon, Mac M1-M4, Mac arm64 or Darwin).
> For older Intel Macs, in all the sections below, if you are presented with the choice to download either a 64-bit (also called x64)
or a 32-bit (also called x86) version of the application **always** choose the 64-bit version.

## Installation notes

If you have already installed Git, Latex, or any of the R or Python related packages
**please uninstall these and follow the instructions below to reinstall them**
(make sure to also remove any user configuration files and backup them if desired).
In order to be able to support you effectively
and minimize setup issues and software conflicts,
we require all students to install the software stack the same way.

Once you have completed these installation instructions,
make sure to follow the post-installation notes at the end
to check that all software is setup correctly.

## UBC Student Email
Please sign up for a UBC Student Email. This account will also grant you access to a range of UBC services, including Microsoft Teams and OneDrive. To do so navigate to [https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service](https://it.ubc.ca/services/email-voice-internet/ubc-student-email-service) and follow the instructions under "Get Started".

## Web browser

In MDS we will be using many tools that work most reliably on Google Chrome and Firefox (including our online quiz software), so we recommend that you use one of these browsers.

- To install Chrome, go to [https://www.google.com/chrome/](https://www.google.com/chrome/), click on "Download Chrome" and follow the instructions on the website to finish the installation.
- To install Firefox, go to [https://www.mozilla.org/en-US/firefox/new/](https://www.mozilla.org/en-US/firefox/new/), click on "Download Firefox" and follow the instructions on the website to finish the installation.

## Password manager

A password manager is an efficient and convenient measure to protect your online accounts from most common threats. While you don't strictly need to use one for any of the courses in MDS, we **highly recommend** that you set one up for your own benefit. Examples of reliable password managers include the ones built into Chrome and Firefox, as well as [Bitwarden](https://bitwarden.com/), and [KeePassXC](https://keepassxc.org/) (if you prefer to sync your passwords manually).

## Slack

For our MDS courses and program announcements, correspondence and course forums we use the communication tool Slack. Slack can be accessed via the web browser, however we strongly recommend installing the Slack App. The Slack app can be installed from the Mac App Store, or from the Slack website. Installation instructions from the Slack website install method are here: [https://slack.com/intl/en-ca/help/articles/207677868-Download-Slack-for-Mac](https://slack.com/intl/en-ca/help/articles/207677868-Download-Slack-for-Mac)

## UBC cloud computing resources

If you at any point during the MDS program are having an issue with your computer,
such as not being able to install all the software before the start of the program,
it is useful to know UBC offers a free online computing environment
that you can use as a backup to follow along in most of the MDS courses.
This is called Jupyter Open
and you can access it by logging into [https://open.jupyter.ubc.ca/](https://open.jupyter.ubc.ca/)
with your UBC CWL.
Jupyter Open allow you to work with JupyterLab, R, Python, and Bash,
and you can install packages via the `conda` and `pip` package managers
(these are all explained further down in the installation instructions
and during the program).

## Bash shell

Apple recently changed the Mac default shell in the Terminal to Zsh, however, we aim to teach with the same shell across all three operating systems we support, which is the Bash shell. Thus, we ask that you change the default shell in your Terminal to Bash by opening the Terminal ([how to video](https://youtu.be/5AJbWEWwnbY)) and typing:

```shell
chsh -s /bin/bash
```

You will have to quit all instances of open Terminals and then **restart** the Terminal for this to take effect.

## Visual Studio Code

### Installing

The open-source text editor Visual Studio Code (VS Code) is both a powerful text editor and a full-blown Python IDE, which we will use for more complex analysis. You can download and install the macOS version of VS Code from the VS code website [https://code.visualstudio.com/download](https://code.visualstudio.com/download).

Pay attention here if you have to download the "Apple silicon" or "Intel Chip" installer.

Once the download is finished, click "Open with Archive utility", and move the extracted VS Code application from "Downloads" to "Applications".

**Be sure to follow both the ["Install VS Code on macOS"](https://code.visualstudio.com/docs/setup/mac#_install-vs-code-on-macos) AND ["Launch VS Code from the command line"](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) steps as well.**

You can test that VS code is installed and can be opened from Terminal by **restarting** terminal and typing the following command:

```bash
code --version
```

you should see something like this if you were successful:

```
1.103.1
360a4e4fd251bfce169a4ddf857c7d25d1ad40da
arm64
```

> **Note:** If you get an error message such as `-bash: code: command not found`, but you can see the VS Code application has been installed, then something went wrong with setting up the launch from the command line. Get back to [these instructions](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) again, in particular you might want to try the described manual method of adding VS Code to your path.

## GitHub

In MDS we will use the publicly available [GitHub.com](https://github.com/) as well as an Enterprise version of GitHub hosted here at UBC, [GitHub.ubc.ca](https://github.ubc.ca). Please follow the set-up instructions for both below.

#### GitHub.com

Sign up for a free account at [GitHub.com](https://github.com/) if you don't have one already.

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

We will be using the command line version of Git as well as Git through RStudio and JupyterLab. Some of the Git commands we will use are only available since Git 2.23, so if your Git is older than this version, we ask you to update it using the Xcode command line tools (not all of Xcode), which includes Git.

Open Terminal and type the following command to install Xcode command line tools:

```bash
xcode-select --install
```

After installation, in terminal type the following to ask for the version:

```bash
git --version
```

you should see something like this (does not have to be the exact same version) if you were successful:

```
git version 2.39.5 (Apple Git-154)
```

> **Note:** If you run into trouble, please see that Install Git > Mac OS section from [Happy Git and GitHub for the useR](http://happygitwithr.com/install-git.html#mac-os) for additional help or strategies for Git installation.

### Configuring Git user info

Next, we need to configure Git by telling it your name and email. To do this type the following into the terminal (replacing Jane Doe and janedoe@example.com, with your name and email (the same used to sign up for GitHub), respectively):

```bash
git config --global user.name "Jane Doe"
git config --global user.email janedoe@example.com
```

> **Note:** To ensure that you haven't made a typo in any of the above, you can view your global Git configurations by either opening the configuration file in a text editor (e.g. via the command `code ~/.gitconfig`) or by typing `git config --list --global`.

### Setting VS Code as the default editor

To make programs run from the terminal (such as `git`) use vscode by default, we will modify `~/.bash_profile`. First, open it using VS Code (this will also create the file if it doesn't already exist):

```bash
code ~/.bash_profile
```

> **Note:** If you see any existing lines in your `~/.bash_profile`
> related to a previous Python or R installation,
> please remove these.

Now append the following lines to `~/.bash_profile`:

```bash
# Set the default editor for programs launch from terminal
EDITOR="code --wait"
VISUAL=$EDITOR  # Use the same value as for "EDITOR" in the line above
```

Then save the file and exit VS Code.

> **Note:** Most terminal programs will read the `EDITOR` environmental variable when determining which editor to use, but some read `VISUAL`, so we're setting both to the same value.

In some cases,
VScode is not set as the default text editor for git
even after appending the two lines above,
so to make sure it is registered properly,
also run the following from your terminal:

```bash
git config --global core.editor "code --wait"
```

On MacOS,
VScode sometimes reads a different configuration file than your other programs.
To avoid this,
open your `~/.bashrc` file:

```bash
code ~/.bashrc
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

## Python, Conda, and JupyterLab

### Python and Conda

We will be using Python for a large part of the program, and `conda` as our Python package manager. To install Python and the `conda` package manager, we will use the [Miniforge platform (read more here)](https://github.com/conda-forge/miniforge).

Select the appropriate link:

You can find the Mac ARM and Intel download links here: <https://conda-forge.org/download/>.
Make sure you use the `Miniforge3` installers.
We will assume you downloaded the file into your `Downloads` folder.

Once downloaded, open up a terminal and run the following command (adjusting for the name of the installer you downloaded, for example `Miniforge3-Darwin-arm64.sh`)

```bash
bash ${HOME}/Downloads/Miniforge3.sh -b -p "${HOME}/miniforge3"
```

After installation run the following commands

```bash
source "${HOME}/miniforge3/etc/profile.d/conda.sh"
conda activate
conda init
```

After installation, **restart** the terminal. If the installation was successful, you will see `(base)` prepending to your prompt string. To confirm that `conda` is working, you can ask it which version was installed:

```bash
conda --version
```

which should return something like this:

```
conda 25.3.1
```

> **Note:** If you see `zsh: command not found: conda`, see the section on [Bash](#bash-shell){:target="_self"} above to set your default Terminal shell to Bash as opposed to Zsh.

Next, type the following to ask for the version of Python:

```bash
python --version
```

Make sure it returns Python 3.12.0 or greater:

```
Python 3.12.11
```

If you do not see Python >3.12, close your terminal and open a new one.
Confirm that you are in the `(base)` environment.
Then update the base python with:

```bash
conda install python=3.12
```

## Installing Python packages

`conda` installs Python packages from different online repositories which are called "channels".
A package needs to go through thorough testing before it is included in the default channel,
which is good for stability,
but also means that new versions will be delayed and fewer packages are available overall.
There is a community-driven effort called the [conda-forge (read more here)](https://conda-forge.org/),
which provides more up to date packages.
Conda-forge is already set up when we installed Miniforge3

To install packages individually,
we can now use the following command:
`conda install <package-name>`.
After running that command
`conda` will show you the packages that will be downloaded,
and you can press enter to proceed with the installation.
If you want to answer `yes` by default and skip this confirmation step,
you can replace `conda install` with `conda install -y`.
Also note that we may occasionally need to install packages using `pip`, the standard Python package manager. The installation command is very similar to that of `conda`: `pip install <package-name>`.

In the next session
we will use `conda` to install
some of the key packages we will use in MDS.

## JupyterLab setup

We will be using `JupyterLab` as our main coding environment
and `pandas` is one of the key data analyses packages in MDS.
The Jupytext Python package and the JupyterLab git extension facilitates
using notebooks in JupyterLab together with Git & GitHub.
The spellchecker helps us correcting typos in our writing.
Install them via the following commands:

```bash
conda install pandas jupyterlab jupyterlab-git jupyterlab-spellchecker jupytext otter-grader
```

We will grade part of your assignments in MDS using the Otter-Grader package for your Jupyter-based assignments.

> Note: You will also install Otter-Grader for R in the later sections of this guide.

To test that your JupyterLab installation is functional, you can type `jupyter lab` into a terminal,
which should open a new tab in your default browser with the JupyterLab interface.
To exit out of JupyterLab you can click `File -> Shutdown`,
or go to the terminal from which you launched JupyterLab and hold `Ctrl` while pressing `c` twice.

![](/resources_pages/imgs/jupyter_lab.PNG)

> **Note:** we will use many more packages than those listed above across the MDS program, however we will manage these using virtual environments (which you will learn about in DSCI 521: Platforms for Data Science).

## R, XQuartz, IRkernel, and RStudio

R is another programming language that we will be using a lot in the MDS program. We will use R both in Jupyter notebooks and in RStudio.

### R

Go to [https://cran.r-project.org/bin/macosx/](https://cran.r-project.org/bin/macosx/) and download the latest version of R for Mac. Open the file and follow the installer instructions. Pay attention that you will have to install `R-4.5.1-arm64.pkg` if you are working with a Mac M1 or higher and `R-4.5.1.pkg` if you are working in a Intel Mac.

After installation, open a new terminal window and type the following:

```bash
R --version
```

You should see something like this if you were successful:

```
R version 4.5.1 (2025-06-13) -- "Great Square Root"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20
```

> **Note:** Although it is possible to install R through conda, we highly recommend not doing so. In case you have already installed R using conda you can remove it by executing `conda uninstall r-base`.

### XQuartz

Some R packages rely on the dependency XQuartz which no longer ships with the Mac OS, thus we need to install it separately. Download it from here: [https://www.xquartz.org/](https://www.xquartz.org/) and follow the installation instructions.

### RStudio

Download the macOS Desktop version (not Pro) of RStudio  [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/). Remember that you have already installed R and can start with "Step 2: Install RStudio". Open the file and follow the installer instructions.

To see if you were successful, try opening RStudio by clicking on its icon (from Finder, Applications or Launchpad). It should open and look something like this picture below:

![](/resources_pages/imgs/RStudio.png)

Now we are going to change RStudio’s *Insert Pipe* shortcut so that it inserts the [new native pipe operator `|>`](https://blog.rstudio.com/2021/06/09/rstudio-v1-4-update-whats-new/).
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

> **Note:** If you are asked to update packages during the installation via `devtools::install_github`, select the `None` option.

## Stan

Stan is the language we will be using later on in the program for Bayesian statistics.
To install it open RStudio and install `rstan`

```R
install.packages("StanHeaders", repos = c("https://stan-dev.r-universe.dev", getOption("repos")))
install.packages("rstan", repos = c("https://stan-dev.r-universe.dev", getOption("repos")))
```

> **Note:** If you are asked to update packages during the installation via `devtools::install_github`, select the `None` option.

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


### IRkernel

The `IRkernel` package is needed to make R work in Jupyter notebooks. To enable this kernel in the notebooks, install by pasting the following command into the RStudio Console:

```R
install.packages('IRkernel')
```

Next, open a terminal and type the following
(you **can't use RStudio** for this step
since it doesn't honor `$PATH` changes in `~/.bash_profile`)

```bash
R -e "IRkernel::installspec()"
```

To see if you were successful, try running JupyterLab and check if you have a working R kernel. To launch the JupyterLab type the following in Terminal:

```bash
jupyter lab
```

A browser should have launched and you should see a page that looks like the screenshot below. Now click on "R" notebook (circled in red on the screenshot below) to launch an JupyterLab with an R kernel.

![](/resources_pages/imgs/jupyter_lab_r_kernel.png)

Sometimes a kernel loads, but doesn't work as expected. To test whether your installation was done correctly now type `library(tidyverse)` in the code cell and click on the run button to run the cell. If your R kernel works you should see something like the image below:

![](/resources_pages/imgs/jupyter_lab_r_kernel2.png)

To improve the experience of using R in JupyterLab,
we will add keyboard shortcuts for inserting the common R operators `<-` and `|>`.
Go to `Settings -> Settings Editor`. Then click `JSON Settings Editor` in the top right corner and click on `Keyboard Shortcuts` in the navigation panel to the left.
You will see two panels,
the right-most "User Preferences" panel allows you to perform advanced modification
of keyboards shortcuts in JupyterLab.
It should be empty.
We're going to add two more shortcuts,
by pasting a text snippet just before the first existing shortcut.


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

To check that the extension is working,
open JupyterLab,
launch an R notebook,
and try inserting the operators by pressing `Alt` + `-` or `Shift` + `Cmd` + `m`, respectively.
You could add any arbitrary text insertion command the same way,
but this is all that is required for MDS.

## Quarto CLI

Quarto is an open-source scientific and technical publishing system that you can access from VSCode, Jupyter Lab, RStudio, or the terminal.

The [RStudio version that you have downloaded](https://quarto.org/docs/tools/rstudio.html) is already equipped with the last version of Quarto. You can check this by opening a new document in `File -> New File -> Quarto Document`.

Quarto can be used outside RStudio as well, this is why we are going to install Quarto CLI. Please, download the [last version of Quarto CLI](https://quarto.org/docs/get-started/) for MacOS.

After the installation finishes, close all the terminals you may have open. Then, open a new one and try running this command:

```bash
quarto --version
```

If the installation was successful you will read the output with the latest quarto version.

## LaTeX

We will install the lightest possible version of LaTeX and it's necessary packages as possible so that we can render Jupyter notebooks and R Markdown documents to html and PDF. If you have previously installed LaTeX, please uninstall it before proceeding with these instructions.

First, run the following command to make sure that `/usr/local/bin` is writable:

```shell
sudo chown -R $(whoami):admin /usr/local/bin
```

> **Note:** You might be asked to enter your password during installation.

Now open RStudio and run the following commands to install the `tinytex` package and setup `tinytex`:

```R
install.packages('tinytex')
tinytex::install_tinytex()
```

You can check that the installation is working by opening a terminal and asking for the version of latex:

```bash
latex --version
```

You should see something like this if you were successful:

```
pdfTeX 3.141592653-2.6-1.40.28 (TeX Live 2025)
kpathsea version 6.4.1
Copyright 2025 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.46; using libpng 1.6.46
Compiled with zlib 1.3.1; using zlib 1.3.1
Compiled with xpdf version 4.04
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

To test that your latex installation is working with jupyter notebooks,
launch `jupyter lab` from a terminal and open either a new notebook
or the same one you used to test IRkernel above.
Go to `File -> Save and Export Notebook as... -> PDF`.
If the PDF file is created,
your LaTeX environment is set up correctly.

### WebPDF export

Jupyter recently added another way to export notebooks to PDF
which does not require Latex
and makes the exported PDF look similar to notebooks exported to HTML.
This requires the an additional package,
which we can install as follows.

```bash
pip install "nbconvert[webpdf]"
playwright install chromium
```

Try this by going to `File -> Save and Export Notebook As... -> WebPDF`.

## PostgreSQL

We will be using PostgreSQL as our database management system. You can download PostgreSQL 16.10 from [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). Follow the instructions for the installation. In the password page, type whatever password you want, **and make sure you save it using a password manager or similar so that you know what it is in November when the SQL course starts** (otherwise you will need to reinstall PostgreSQL). For all the other options, use the default. You do not need to run "StackBuilder" at the end of the installation (if you accidentally launch the StackBuilder, click "cancel", you don't need to check any boxes).

To test if the installation was successful open the `SQL Shell` app from the LaunchPad or applications directory. You will be asked to setup your configuration:

- Accept the default value (the one within square brackets) for the first three values by pressing enter three times,
- Enter `postgres` as the default username and hit enter,
- Finally, type in the password that you set during installation and press enter one last time.

It should look like this if it is working correctly:

![](/resources_pages/imgs/psql-mac-2022-23.png)

If you are asked about stackbuilder, you can skip this for now.

## Docker

You will use Docker to create reproducible, sharable and shippable computing environments for your analyses. For this you will need a Docker account. You can [sign up for a free one here](https://store.docker.com/signup?next=%2F%3Fref%3Dlogin).

After signing-up and signing into the Docker Store, go here: [https://store.docker.com/editions/community/docker-ce-desktop-mac](https://store.docker.com/editions/community/docker-ce-desktop-mac) and click on the button "Docker Desktop for Mac with Apple silicon" or "Docker Desktop for Mac with Intel". Then follow the installation instructions on that screen to install the stable version.

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

## VS Code extensions

The real magic of VS Code is in the extensions that let you add languages, debuggers, and tools to your installation to support your specific workflow. Now that we have installed all our other Data Science tools, we can install the VS Code extensions that work really well with them. From within VS Code you can open up the [Extension Marketplace (read more here)](https://code.visualstudio.com/docs/editor/extension-gallery) to browse and install extensions by clicking on the Extensions icon in the Activity Bar indicated in the figure below.

![](/resources_pages/imgs/vscode.png)

To install an extension, go to `View -> Extensions` or click in the icon as you can see in the image above. Then, search for the names of the ones you are interested in the search bar, click the extension you want, and click "Install". There are extensions available to make almost any workflow or task you are interested in more efficient! Here we are interested in setting up VS Code as a Python IDE. To do this, search for and install the following extensions:

- Python (everything Python: notebooks, debugging, linting, formatting, etc.)
- markdownlint (markdown linting and style checking extension)
- GitLens - Git supercharged (powerful extension that extends VS Code's native git capabilities)
- Git History (intutive view of your git history)
- Docker (easily use Docker from VS Code)
- Quarto (integrated render and preview for Quarto documents and [more](https://quarto.org/docs/tools/vscode.html))

- (Optional) Material Theme and/or Predawn Theme Kit (additional colour themes to choose from)
- (Optional) Material Icon Theme (great-looking custom file icons!)

[This video tutorial](https://www.youtube.com/watch?v=06I63_p-2A4) is an excellent introduction to using VS Code in Python.

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
code ~/.bash_profile
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
export PS1=${CONDA_PROMPT_MODIFIER}'\[\033[01;32m\]\u@\h\[\033[01;35m\] \w\[\033[34m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

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
alias jl='jupyter lab'
alias ca='conda activate'
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
curl -Sso ~/.mds-help.sh https://raw.githubusercontent.com/UBC-MDS/UBC-MDS.github.io/master/resources_pages/mds-help.sh
```

Open a new terminal and type `mds-help`,
your terminal should display
the most important terminal commands we will be learning in MDS.
You don't need to memorize these now,
just remember that if you ever forget how to do something with `bash`, `git` or `conda`,
you can type `mds-help` in your terminal
and use it as a reference.

## Post-installation notes

You have completed the installation instructions, well done 🙌!
We have created a script to help you check that your installation was successful,
and to provide instructions for how you can troubleshoot any potential issues.
To run this script,
please execute the following command from your terminal.

```bash
bash <(curl -Ss https://raw.githubusercontent.com/UBC-MDS/UBC-MDS.github.io/master/resources_pages/check-setup-mds.sh)
```

The output from running the script will look something like this:

````
# MDS setup check 2025.1

If a program or package is marked as MISSING,
this means that you are missing the required version of that program or package.
Either it is not installed at all or the wrong version is installed.
The required version is indicated with a number and an asterisk (*),
e.g. 4.* means that all versions starting with 4 are accepted (4.0.1, 4.2.5, etc).

You can run the following commands to find out which version
of a program or package is installed (if any):

name_of_program --version  # For system programs
conda list  # For Python packages
R -q -e "installed.packages()[,c(Package, Version)]"  # For R package

Checking program and package versions...

## Operating system
ProductName:	macOS
ProductVersion:	12.5
BuildVersion:	21G72

## System programs
OK        psql (PostgreSQL) 14.5
OK        rstudio 2022.07.1+554
OK        R 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
OK        python 3.10.5
OK        conda 4.13.0
OK        bash 3.2.57(1)-release (arm64-apple-darwin21)
OK        git 2.32.1 (Apple Git-133)
OK        make 3.81
OK        latex 3.141592653-2.6-1.40.24 (TeX Live 2022)
OK        tlmgr 58:07 +0200)
OK        docker 20.10.17, build 100c701
OK        code 1.70.1

## Python packages
OK        pandas=1.4.3
OK        pyppeteer=1.0.2
OK        nbconvert=6.4.4
OK        jupyterlab=3.4.5
OK        jupyterlab-git=0.38.0
OK        jupytext=1.14.0
OK        jupyterlab-spellchecker=0.7.2
OK        jupyterlab PDF-generation was successful.
OK        jupyterlab WebPDF-generation was successful.
OK        jupyterlab HTML-generation was successful.

## R packages
OK        tidyverse=1.3.2
OK        markdown=1.1
OK        rmarkdown=2.14
OK        renv=0.15.5
OK        IRkernel=1.3
OK        tinytex=0.40
OK        janitor=2.1.0
OK        gapminder=0.3.0
OK        readxl=1.4.0
OK        ottr=1.1.3
OK        canlang=0.0.1
OK        rmarkdown PDF-generation was successful.
OK        rmarkdown HTML-generation was successful.

The above output has been saved to the file /Users/florenciadandrea/Documents/check-setup-mds.log
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

## Positron (Optional)

You may also opt to install Positron.
It's a VS Code Fork that works well with Python and R for data science tasks.
This is not required for the course, but you may see a few instructors use it.

To download Positron, you can follow the link here:

<https://positron.posit.co/start.html>

You do not need to follow any of the Python or R setup instructions (we have already done that)

## Attributions

* [Harvard CS109](http://cs109.github.io/2015/)
* [UBC STAT 545](http://stat545.com/packages01_system-prep.html#mac-os-system-prep) licensed under the [CC BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/legalcode).
* [Software Carpentry](https://software-carpentry.org/)
