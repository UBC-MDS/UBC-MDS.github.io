---
layout: page
title: Windows
subtitle: MDS software stack install instructions for Windows 2022/23
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
- [Visual Studio Code](#visual-studio-code){:target="_self"}
- [GitHub](#github){:target="_self"}
- [Git, Bash, and Windows Terminal](#git-bash-and-windows-terminal){:target="_self"}
- [Python, Conda, and JupyterLab](#python-conda-and-jupyterlab){:target="_self"}
- [R, IRkernel, Rtools, and RStudio](#r-irkernel-rtools-and-rstudio){:target="_self"}
- [LaTeX](#latex){:target="_self"}
- [Make](#make){:target="_self"}
- [PostgreSQL](#postgresql){:target="_self"}
- [Docker](#docker){:target="_self"}
- [Quarto CLI](#quarto-cli){:target="_self"}
- [VS Code extensions](#vs-code-extensions){:target="_self"}
- [Improving the bash configuration](#improving-the-bash-configuration){:target="_self"}
- [Post-installation notes](#post-installation-notes){:target="_self"}

## Installation notes

If you have already installed Git, Latex, Make, or any of the R or Python related packages
**please uninstall these and follow the instructions below to reinstall them**
(make sure to also remove any user configuration files and backup them if desired).
In order to be able to support you effectively
and minimize setup issues and software conflicts,
we require all students to install the software stack the same way.

In all the sections below,
if you are presented with the choice to download either a 64-bit (also called x64)
or a 32-bit (also called x86) version of the application **always** choose the 64-bit version.

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

A password manager is an efficient and convenient measure to protect your online accounts from most common threats. While you don't strictly need to use one for any of the courses in MDS, we **highly recommend** that you set one up for your own benefit. Examples of reliable password managers include the ones built into Chrome and Firefox, [Bitwarden](https://bitwarden.com/), and [KeePassXC](https://keepassxc.org/) (if you prefer to sync your passwords manually).

## Slack

For MDS program announcements, course forums, and correspondence we use the communication tool Slack. Slack can be accessed via the web browser, but we recommend using the Slack app, which can be installed via downloadable file from the slack website [https://slack.com/intl/en-ca/downloads/windows](https://slack.com/intl/en-ca/downloads/windows).

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

## Visual Studio Code

The open-source text editor Visual Studio Code (VS Code) is both a powerful text editor and a full-blown Python IDE, which we will use for more complex analysis. Go to [https://code.visualstudio.com/download](https://code.visualstudio.com/download) and download the windows version of VS Code. After the download has finished, run the installer and accept the default configuration for all pages except for the following:

- *Optional* On the **Select Additional Tasks** page, check "Create a desktop icon" under "Additional icons".
- Also on the **Select Additional Tasks** page check all four boxes under "Other"
    - "Add 'Open with Code' action to Windows file context menu"
    - "Add 'Open with Code' action to Windows directory context menu"
    - "Register Code as an editor for supported file types"
    - "Add to PATH" (this should be selected by default).

![](/resources_pages/imgs/vs_code.png)

## GitHub

In MDS we will use the publicly available [GitHub.com](https://github.com/) as well as an Enterprise version of GitHub hosted here at UBC, [GitHub.ubc.ca](https://github.ubc.ca). Please follow the set-up instructions for both below.

### GitHub.com

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

## Git, Bash, and Windows Terminal

Although these three are separate programs,
we are including them in the same section here
since they are related and used together on Windows.
Briefly, we will be using the Bash shell to interact with our computers via a command line interface,
Git to keep a version history of our files and upload to/download from to GitHub,
and Windows Terminal to run the both Bash and Git.

Go to <https://git-scm.com/download/win> and download the windows version of git
(this installer also includes Bash and we will refer to it as Git Bash).
After the download has finished,
run the installer and accept the default configuration for all pages except for the following:

- On the **Select Components** page, add a Git Bash profile to Windows Terminal.

    ![](/resources_pages/imgs/gitbash-terminal-profile.png)

- On the **Choosing the default editor used by Git** page, select "Use Visual Studio Code as Git's default editor" from the drop-down menu'
    - You should already have VS Code installed from an earlier installation step

    ![](/resources_pages/imgs/vscode-as-git-editor.png)

- Set the default branch name to `main`

    ![](/resources_pages/imgs/gitbash-defualt_main.png)

For the remainder screens, pick the default selected options:

- Adjusting your PATH environment: Git from the command line and also from 3rd-party software
- Choosing the SSH executable: Use bundled OpenSSH
- Choosing HTTPS transport backend: Use the OpenSSL library
- Configuring the line ending conversions: Checkout Windows-style, commit Unix-style line endings
- Configuring the terminal emulator to use with Git Bash: Use MinTTY (the default terminal of MSYS2)
- Choose the default behavior of 'git pull': Fast-forward or merge
- Choose a credential helper: Git Credential Manager
- Configuring extra options: Enable file system caching
    - You can also choose to "Enable symbolic links"
- Configuring experimental options: leave it unchecked


[To install windows terminal visit this link](https://aka.ms/terminal)
and click `Get` to open it in Windows Store.
Inside the Store, click `Get` again and then click `Install`.
After installation,
click `Launch` to start Windows Terminal.
In the top of the window,
you will see the tab bar with one open tab,
a plus sign,
and a down arrow.
Click the down arrow and select `Settings`
(or type the shortcut `Ctrl` + `,`).
In the `Startup` section,
click the dropdown menu under `Default profile`
and select `Git Bash`.

![](/resources_pages/imgs/git-bash-default-shell.png)

You can now launch the Windows terminal from the start menu
or pin it to the taskbar like any other program
(you can read the rest of the article linked above for additional tips if you wish).
To make sure everything worked,
close down Windows Terminal,
and open it again.
Git Bash should open by default,
the text should be green and purple,
and the tab should read  `MINGW64:/c/Users/$USERNAME`
(you should also see `/c/Users/$USERNAME` if you type `pwd` into the terminal).
This screenshot shows what it should look like:

![](/resources_pages/imgs/windows-terminal-gitbash.png)

> **Note:** Whenever we refer to "the terminal" in these installation instructions,
we want you to use the Windows Terminal that you just installed with the Git Bash profile.
Do **not** use Windows PowerShell, CMD, or anything else unless explicitly instructed to do so.

To open a new tab you can click the plus sign or use `Ctrl + Shift + t`
(you can close a tab with `Ctrl + Shift + w`).
To copy text from the terminal,
you can highlight it with the mouse and then click `Ctrl + Shift + c`.
To paste text you use `Ctrl + Shift + v`,
try it by pasting the following into the terminal
to check which version of Bash you just installed:

```
bash --version
```

The output should look similar to this:

```
GNU bash, version 5.2.15(1)-release (x86_64-pc-msys)
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

> **Note:** If there is a newline (the `enter` character) in the clipboard
> when you are pasting into the terminal,
> you will be asked if you are sure you want to paste
> since this newline will act as if you pressed `enter`
> and run the command.
> As a guideline you can press `Paste anyway`
> unless you are sure you don't want this to happen.

Let's also check which version of git was installed:

```
git --version
```

```
git version 2.42.0.windows.2
```

> **Note:**  You can launch many windows programs from the terminal, e.g. to launch VS Code that we installed previously, you would type in `code`, let's use this to check the version of vscode that we installed:

```
code --version
```

```
1.81.1
6d9b74a70ca9c7733b29f0456fd8195364076dda
x64
```

### Configuring Git user info

Next, we need to configure Git by telling it your name and email. To do this type the following into the terminal (replacing Jane Doe and janedoe@example.com, with your name and email (the same used to sign up for GitHub), respectively):

```
git config --global user.name "Jane Doe"
git config --global user.email janedoe@example.com
```

> **Note**: to ensure that you haven't made a typo in any of the above, you can view your global Git configurations by either opening the configuration file in a text editor (e.g. via the command `code ~/.gitconfig`) or by typing `git config --list --global`.

### Setting VS Code as the default editor

To make programs run from the terminal (such as `git`) use VS Code by default, we will modify `~/.bash_profile`. First, open it using VS Code:

```
code ~/.bash_profile
```

> **Note**: If you see any existing lines in your `~/.bash_profile`
> related to a previous Python or R installation,
> please remove these.

Append the following lines:

```
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

On Windows,
VScode sometimes reads a different configuration file than Git Bash.
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

### Setting Git Bash as the default VS Code terminal profile

Finally,
let's make sure the VS Code uses our newly installed Git Bash shell
as its default terminal profile:

1. Open Up VS Code and go to the general preferences / settings (shortcut `Ctrl` + `,`).
2. Type in "Default terminal profile" and find the entry that reads `Terminal > Integrated > Default profile: Windows`.
3. Select Git Bash from the drop down menu of this entry.

Now Git Bash should be opened automatically each time you open a new terminal in side VS Code.

## Python, Conda, and JupyterLab

### Python and Conda

We will be using Python for a large part of the program, and `conda` as our Python package manager. To install Python and the `conda` package manager, we will use the [Miniforge platform (read more here)](https://github.com/conda-forge/miniforge).

Select the appropriate link:

You can find the Windows download links here: <https://conda-forge.org/miniforge/>.
Make sure you use the `Miniforge3` installers, not the other ones listed.
We will assume you downloaded the file into your `Downloads` folder.

Once downloaded, run the installer.

Use all the default options in the installer.

The install location should look something like: `C:\Users\YOUR_USER_NAME\miniforge3`

> **Note:** Do *not* add miniforge to PATH. We will set this up later.

After installation, open the Start Menu and search for the program called "Miniforge Prompt". When this opens you will see a prompt similar to `(base) C:\Users\your_name`. Type the following to check that your Python installation is working:

```
python --version
```

which should return Python 3.11.0 or greater:

```
Python 3.11.0
```

If not, run the following command in the Miniforge Prompt,
Confirm that you are in the `(base)` environment.
Then update the base python with:

```bash
conda install python=3.11
```

### Integrating Python with the Git Bash terminal

To avoid having to open the separate Anaconda Prompt every time we want to use Python, we can make it available from the (Git Bash) terminal, which is what we will be using most of the time. To set this up, open the "Miniforge Prompt" again and type:

```
conda init bash
```

You will see that this modified a few configuration files, which makes `conda` visible to the terminal. Close all open terminal windows and launch a new one, you should now see that the prompt string has changed to include the word `(base)` as in the screenshot below:

![](/resources_pages/imgs/add-conda-env-to-ps1.png)

If you type

```
python --version
```

you should now see the same output as above:

```
Python 3.11.0
```

Let's also check the version of the `conda` package manager. If you type

```
conda --version
```

you should see something like this

```
conda 23.5.2
```

> **Optional:** One annoyance with our current terminal setup is that the word `(base)` is not on the same row as the rest of the prompt string (the part with `your_name@your_computer`. To fix this we can edit the `.bash_profile` configuration file to indicate that we do not want a newline at the beginning of the prompt string. Open up the configuration file using VS Code by typing the following command into a terminal:
>
> ```
> code "/c/Program Files/Git/etc/profile.d/git-prompt.sh"
> ```
>
> Delete the line that reads the following (it should be line 13):
>
> ```
> PS1="$PS1"'\n'       # new line
> ```
>
> While we are in this file,
> let's also remove the line that says `PS1="$PS1"'$MSYSTEM '          # show MSYSTEM` (now should be line 16),
> to remove some clutter from the terminal.
>
> Click to save the file,
> when VS Code prompts you that the saving failed,
> click "Retry as Admin" and then "Yes".
> That's it!
> Now if you launch a new terminal instance,
> you will see `(base)` on the same line as the rest of the prompt string as in the screenshot below.
>
> ![](/resources_pages/imgs/remove-newline-from-ps1.png)


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
The spellchecker helps us correcting typos in our writing
and the LSP packages fill the same function for our code.
Install them via the following commands:

```bash
conda install pandas jupyterlab=4 jupyterlab-git jupyterlab-spellchecker jupytext
```

If the above command fails, try installing a few packages at a time instead of all of them at once.

We will grade part of your assignments in MDS using the Otter-Grader package. For your Jupyter-based assignments, you need to install Otter-Grader using the following command:

```bash
pip install otter-grader
```

> Note: You will also install Otter-Grader for R in the later sections of this guide.

To test that your JupyterLab installation is functional, you can type `jupyter lab` into a terminal,
which should open a new tab in your default browser with the JupyterLab interface.
To exit out of JupyterLab you can click `File -> Shutdown`,
or go to the terminal from which you launched JupyterLab and hold `Ctrl` while pressing `c` twice.

![](/resources_pages/imgs/jupyter_lab.PNG)

> **Note:** we will use many more packages than those listed above across the MDS program, however we will manage these using virtual environments (which you will learn about in DSCI 521: Platforms for Data Science).

## R, IRkernel, Rtools, and RStudio

R is another programming language that we will be using a lot in the MDS program. We will use R both in Jupyter notebooks and in RStudio.

### R

Go to <https://cran.r-project.org/bin/windows/base/> and download the latest version of R for Windows. Open the file and follow the installer instructions accepting the default configuration.

After the installation is complete, we will add the R executables to the PATH variable in terminal so that you can use it without typing the full path to R each time. Open a terminal and type:

```
code ~/.bash_profile
```

Append the following lines to the file

```
# Automatically expand the R version number
R_DIR=(/c/Program\ Files/R/*/bin/x64)
# Add R and Rscript to PATH
export PATH="$R_DIR:$PATH" # double quote is important here
```

Then save the file and exit VS Code.
Now you can open a new terminal window and type

```
R --version
```

which should return something like:

```
R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.
```

> **Note**: Although it is possible to install R through Anaconda, we highly recommend not doing so. In case you have already installed R using Anaconda you can remove it by executing `conda uninstall r-base`.

### RStudio

Download the Windows version of RStudio Desktop  from <https://posit.co/download/rstudio-desktop/>. Open the file and follow the installer instructions.

To see if you were successful, try opening RStudio by clicking on its icon. It should open and looks something like this picture below:

![](/resources_pages/imgs/RStudio.png)

Next, we will make sure that Rstudio uses the same directories as R from terminal for its configuration. To do this, we will need to set an environmental variable in Windows. First, open the start menu, type "Edit the system environment variables" and select the match that reads "Edit the system environment variables". Click the button at the bottom that reads "Environmental Variables...":

![](/resources_pages/imgs/sys-props-env-vars.png)

Under "User variable" click the "New..." button:

![](/resources_pages/imgs/env-vars-new-user-var.png)

And type in `R_USER` as the "Variable name" and `C:\Users\username` as the "Variable value", replacing `username` with your actual user name (if you don't know your user name, look at the top of the screenshot above where it says "User variables for your_username"):

![](/resources_pages/imgs/new-user-var-values.png)

Click "OK" on all of the three windows we opened above and you're done! If you open the console in RStudio and also R from the Windows Terminal (open Windows Terminal, type `R`, and then press `enter`) and type the following in both:

```
.libPaths()
```

both applications should return the same values, and the first one should be a path inside your user directory e.g.

```
[1] "C:/Users/Florencia/AppData/Local/R/win-library/4.2"
[2] "C:/Program Files/R/R-4.2.1/library"
```

If they don't return the same paths, please try to setting up your environmental variable again
and making sure that it is pointing to the correct folder.

**Do not continue unless both R from terminal and R from RStudio return the same paths here or later parts of the installation will fail.**



Now we are going to check that RStudio’s *Insert Pipe* shortcut inserts the [new native pipe operator `|>`](https://blog.rstudio.com/2021/06/09/rstudio-v1-4-update-whats-new/).

Press `Shift` + `Ctrl` + `m` in RStudio's console. If it is returned the following operator `%>%` instead of `|>`, go to `Tools > Global Options > Code > Editing` and tick the following option:

![](/resources_pages/imgs/new-pipe-rstudio.png)

Once the change is made you can try again in the RStudio console `Ctrl` + `Shift` + `m` verify that it functions.  Close down RStudio afterwards.

### Rtools

Windows users will also need to install Rtools, which will allow you to use external libraries. Go to <http://cran.r-project.org/bin/windows/Rtools/> and download the latest version. After the download has finished, run the installer with the default configuration. **Do not** follow the Rtools' website instructions for "Putting Rtools on the PATH". RStudio will put Rtools on the PATH automatically when it is needed.

To test if you're installation was successful,
open RStudio (**restart** it if you already have it open)
and type the following into the Console:

```
install.packages("jsonlite", type = "source")
```

If the `jsonlite` package installs without errors, Rtools is setup correctly.

### Installing R packages

Next, install the key R packages needed for the start of MDS program,
by opening up RStudio and
typing the following into the R console inside RStudio:

```R
install.packages(c('tidyverse', 'renv', 'usethis', 'devtools', 'markdown', 'rmarkdown', 'languageserver', 'janitor', 'gapminder', 'readxl'))
devtools::install_github("ucbds-infra/ottr@stable")
devtools::install_github("ttimbers/canlang")
```

> **Note:** If you are asked to update packages during the installation via `devtools::install_github`, select `3: None`.

## Stan

Stan is the language we will be using later on in the program for Bayesian statistics.
To install it open RStudio and install `rstan`

```R
install.packages("StanHeaders", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
```

> **Note:** If you are asked to update packages during the installation via `devtools::install_github`, select `3: None`.

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

> **Note:** If you are asked to update packages during the installation via `devtools::install_github`, select `3: None`.

### IRkernel

The `IRkernel` package is needed to make R work in Jupyter notebooks. To enable this kernel in the notebooks, install it and run the setup via the following two commands:

```
install.packages('IRkernel')
IRkernel::installspec()
```

> **Note:** If you see an error message saying "jupyter-client has to be installed...",
> close RStudio and run the following line from your terminal instead `R -e "IRkernel::installspec()"`.

To see if you were successful, try running JupyterLab and check if you have a working R kernel. To launch JupyterLab, type the following in a terminal:

```
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
and try inserting the operators by pressing `Alt` + `-` or `Shift` + `Ctrl` + `m`, respectively.
You could add any arbitrary text insertion command the same way,
but this is all that is required for MDS.

## Quarto CLI

Quarto is an open-source scientific and technical publishing system that you can access from VSCode, Jupyter Lab, RStudio, or the terminal.

The [RStudio version that you have downloaded](https://quarto.org/docs/tools/rstudio.html) is already equipped with the last version of Quarto. You can check this by opening a new document in `File -> New File -> Quarto Document`.

Quarto can be used outside RStudio as well, this is why we are going to install Quarto CLI. Please, download the [last version of Quarto CLI](https://quarto.org/docs/get-started/) for Windows.

After the installation finishes, close all the terminals you may have open. Then, open a new one and try running this command:

```bash
quarto --version
```
If the installation was successful you will read the output:

```bash
1.3.450
```

> **Note:** Pay attention that due to the Windows settings suggested in this installation you will always have to write  `quarto.cmd` instead of `quarto` to run Quarto commands. Read more [here](https://community.rstudio.com/t/bash-quarto-command-not-found/144187/3).


## LaTeX

We will install the lightest possible version of LaTeX and it's necessary packages as possible so that we can render Jupyter notebooks and R Markdown documents to html and PDF. If you have previously installed LaTeX, please uninstall it before proceeding with these instructions.

First, open RStudio and run the following commands to install the `tinytex` package and setup `tinytex`:

```
install.packages('tinytex')
tinytex::install_tinytex()
```

Note that you might see two error messages regarding lua during the installation, you can safely ignore these, the installation will complete successfully after clicking "OK".

In order for Git Bash to be able to find the location of TinyTex,
you will need to [sign out of Windows](https://support.microsoft.com/en-us/windows/sign-out-of-windows-346925bb-024c-cd86-7a53-9066242a9ed3) and back in again.
After doing that,
you can check that the installation worked
by opening a terminal and asking for the version of latex:

```
latex --version
```

You should see something like this if you were successful:

```
pdfTeX 3.14159265-2.6-1.40.25 (TeX Live 2023)
kpathsea version 6.3.4
Copyright 2022 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.37; using libpng 1.6.37
Compiled with zlib 1.2.11; using zlib 1.2.11
Compiled with xpdf version 4.03
```

The above is all we need to have LaTeX work with R Markdown documents, however for Jupyter we need to add several more packages.

When you sign back in,
install the additional LaTeX packages needed for Jupyter by pasting the following into the new terminal instance and press enter:

```
tlmgr.bat install eurosym \
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
This requires the `pyppeteer` package,
which we can install by typing the following into Windows Terminal.

```bash
pip install "nbconvert[webpdf]"
playwright install chromium
```

Now try exporting a notebook by clicking
`File -> Save and Export Notebook As... -> WebPDF`.

## Make

Later in the program, we will be using `make` to automate our analysis scripts. [Download `make` from this URL](https://sourceforge.net/projects/ezwinports/files/make-4.4.1-without-guile-w32-bin.zip/download). Click on the downloaded zip-file to open it in the File Explorer and click the button in the "Extract" tab that reads "Extract all". Change the extract location to `C:\Users\YOUR_USERNAME\make-4.4.1` (substituting in your actual username instead of `YOUR_USERNAME`) and click "Extract". See the screenshots below if you're unsure what to click.

![](/resources_pages/imgs/extract-make.png)

![](/resources_pages/imgs/extract-make-path.png)

> **Note:** It is advisable to show file extensions by default in the Windows File Explorer. Click the `View` tab and check the box next to `File name extensions`.

Next we need to add make's `bin` folder to our PATH so that we can use the command `make` from the terminal (like we did with R earlier). Open the bash configuration file with VS Code again by pasting this into a terminal:

```
code ~/.bash_profile
```

And replace the section that reads:

```
# Add R and Rscript to path
export PATH="${R_DIR}:$PATH"
```

with the following to prepend make's bin folder to the PATH
(note that `${USERNAME}` below will be automatically expanded to your actual username by bash,
so you don't need to replace it manually.

```
# Add R, Rscript, and Make to path
export PATH="/c/Users/${USERNAME}/make-4.4.1/bin:${R_DIR}:$PATH"
```

Then save the file and exit VS Code.
Launch a new terminal and run

```
make --version
```

which should return something like

```
GNU Make 4.3
Built for Windows32
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

## PostgreSQL

We will be using PostgreSQL as our database management system. You can download the most recent version of PostgreSQL from [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). Follow the instructions for the installation. In the password page, type whatever password you want, **and make sure you save it using a password manager or similar so that you know what it is in November when the SQL course starts** (otherwise you will need to reinstall PostgreSQL). For all the other options, use the default. You do not need to run "StackBuilder" at the end of the installation (if you accidentally launch the StackBuilder, click "cancel", you don't need to check any boxes).

To test if the installation was successful open the `SQL Shell` app from the Start menu. You will be asked to setup your configuration, accept the default value (the one within square brackets) for the first four values by pressing enter four times, then type in your password and press enter one last time. It should look like this if it is working correctly:

![](/resources_pages/imgs/psql-windows.png)

## Docker

You will use Docker to create reproducible, sharable and shippable computing environments for your analyses. For this you will need a Docker account. You can sign up for a free one [here](https://store.docker.com/signup?next=%2F%3Fref%3Dlogin).

After signing-up and signing into the Docker Store, go [here](https://store.docker.com/editions/community/docker-ce-desktop-windows) and click on the "Get Docker Desktop" button on the right hand side of the screen. Then follow the installation instructions on that screen to install the stable version.

> **Note:** If you see a warning saying that your WSL installation is incomplete, you can click the link to install the kernel update and then **restart** per the instructions in the warning message.

After installation (Docker will make you sign out to finish installing), launch a terminal and type

```
docker run hello-world
```

which should output something like this:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pulling fs layer
0e03bdcc26d7: Verifying Checksum
0e03bdcc26d7: Download complete
0e03bdcc26d7: Pull complete
Digest: sha256:49a1c8800c94df04e9658809b006fd8a686cab8028d33cfba2cc049724254202
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

The real magic of VS Code is in the extensions that let you add languages, debuggers, and tools to your installation to support your specific workflow. From within VS Code you can open up the [Extension Marketplace](https://code.visualstudio.com/docs/editor/extension-gallery) to browse and install extensions by clicking on the Extensions icon in the Activity Bar indicated in the figure below.

![](/resources_pages/imgs/vscode.png)

To install an extension, you simply search for it in the search bar, click the extension you want, and then click "Install". There are extensions available to make almost any workflow or task you are interested in more efficient! Here we are interested in setting up VS Code as a Python IDE. To do this, search for and install the following extensions:

- Python (everything Python: notebooks, debugging, linting, formatting, etc.)
- markdownlint (markdown linting and style checking extension)
- GitLens (powerful extension that extends VS Code's native git capabilities)
- Git History (intutive view of your git history)
- Docker (easily use Docker from VS Code)
- Quarto (integrated render and preview for Quarto documents and [more](https://quarto.org/docs/tools/vscode.html))

- (Optional) Material Theme and/or Predawn Theme Kit (additional colour themes to choose from)
- (Optional) Material Icon Theme (great-looking custom file icons!)

This [video tutorial](https://www.youtube.com/watch?v=-nh9rCzPJ20) is an excellent introduction to using VS Code in Python.

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
open the configuration file:

```
code ~/.bash_profile
```

Then paste the following at the end of the file
(make sure not to overwrite any existing lines)
and save it afterwards:

```
# Show unstaged (*) and staged (+) changes in the prompt string
export GIT_PS1_SHOWDIRTYSTATE=1

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
alias jl='jupyter lab'
alias ca='conda activate'
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
# `man` function to display help messages with a pager as on Unix
man() {
    $1 --help | less
}
```

Finally, download and save the MDS help script via the following command.

```
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
and to provide instructions for how you can troubleshoot any issues.
To run this script,
please execute the following command from your terminal.

````
bash <(curl -Ss https://raw.githubusercontent.com/UBC-MDS/UBC-MDS.github.io/master/resources_pages/check-setup-mds.sh)
```

The output from running the script will look something like this:

````
# MDS setup check 2023.1

If a program or package is marked as MISSING,
this means that you are missing the required version of that program or package.
Either it is not installed at all or the wrong version is installed.
The required version is indicated with a number and an asterisk (*),
e.g. 4.* means that all versions starting with 4 are accepted (4.0.1, 4.2.5, etc).

You can run the following commands to find out which version
of a program or package is installed (if any):
```
name_of_program --version  # For system programs
conda list  # For Python packages
R -q -e "as.data.frame(installed.packages()[,3])"  # For R packages
```

Checking program and package versions...

## Operating system
Microsoft Windows 11 Pro
64-bit
10.0.22621

MISSING You need Windows 10 or 11 with build number >= 10.0.19041. Please run Windows update.

## System programs
OK        psql (PostgreSQL) 15.4
 2023.06.2+561dio
OK        tlmgr revision 66798 (2023-04-08 02:15:21 +0200)
OK        R 4.3.1 (2023-06-16 ucrt) -- "Beagle Scouts"
OK        python 3.11.4
OK        conda 23
OK        bash 4-pc-msys)
OK        git 2.42.0.windows.1
OK        make 4.4.1
OK        latex 3.141592653-2.6-1.40.25 (TeX Live 2023)
OK        docker 24.0.5, build ced0996
OK        code 1.81.1

## Python packages
OK        otter-grader=5.1.3
OK        pandas=2.0.3
OK        nbconvert-core=7.7.4
OK        playwright=1.37.0
OK        jupyterlab=4.0.5
OK        jupyterlab-git=0.41.0
OK        jupyterlab-spellchecker=0.8.4
OK        jupyterlab PDF-generation was successful.
OK        jupyterlab WebPDF-generation was successful.
OK        jupyterlab HTML-generation was successful.

## R packages
OK        tidyverse=2.0.0
OK        markdown=1.8
OK        rmarkdown=2.24
OK        renv=1.0.2
OK        IRkernel=1.3.2
OK        tinytex=0.46
OK        janitor=2.2.0
OK        gapminder=1.0.0
OK        readxl=1.4.3
OK        ottr=1.1.3
OK        canlang=0.0.1
OK        rmarkdown PDF-generation was successful.
OK        rmarkdown HTML-generation was successful.

The above output has been saved to the file /c/Users/Danie/check-setup-mds.log
together with system configuration details and any detailed error messages about PDF and HTML generation.
You can open this folder in your file browser by typing `explorer .` (without the surrounding backticks).
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

## Attributions
* [Harvard CS109](http://cs109.github.io/2015/)
* [UBC STAT 545](http://stat545.com/packages01_system-prep.html#mac-os-system-prep) licensed under the [CC BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/legalcode).
* [Software Carpentry](https://software-carpentry.org/)
* [Oracle - How do I set or change the PATH system variable?](https://www.java.com/en/download/help/path.xml)
* [Numerical Methods - Getting started](https://clouds.eos.ubc.ca/~phil/numeric/python.html)
* [RStudio - New native pipe operator](https://blog.rstudio.com/2021/06/09/rstudio-v1-4-update-whats-new/)
