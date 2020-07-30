#!/usr/bin/env bash
# Checks that the correct version of all system programs and R & Python packages
# which are needed for the start of the MDS program are correctly installed.

# 1. System programs
# Tries to run system programs and if successful greps their version string
# Currently marks both uninstalled and wrong verion number as MISSING
echo ''
echo "# MDS setup check 0.0.2" | tee check-setup-mds.log
echo '' | tee check-setup-mds.log
echo 'If a program or package is marked as MISSING,'
echo 'this means that it either is not installed at all or the wrong version is installed.'
echo 'The required version is indicated with a number and an asterisk (*),'
echo 'e.g. 4.* means that all versions starting with 4 are accepted (4.0.1, 4.2.5, etc).'
echo ''
echo 'Checking program and package versions...'
echo "## System programs" >> check-setup-mds.log

# There is an esoteric case for .app programs on macOS where `--version` does not work
# So far, we only install rstudio as an .app
if [[ "$(uname)" == 'Darwin' ]]; then
    if $(grep -iq "= \"1.*" <<< "$(mdls -name kMDItemVersion /Applications/RStudio.app)"); then
        # This is what is needed instead of --version
        installed_version_tmp=$(grep -io "= \"1.*" <<< "$(mdls -name kMDItemVersion /Applications/RStudio.app)")
        # Tidy strangely formatted version number
        installed_version=$(sed "s/= //;s/\"//g" <<< "$installed_version_tmp")
        echo "OK        "rstudio $installed_version >> check-setup-mds.log
    else
        echo "MISSING   rstudio 1.*" >> check-setup-mds.log
    fi
fi

# The single equal sign syntax is what we have in the install instruction for conda,
# so I am using it below for Python packages so that we can just paste in the same
# syntax as for the conda installations instructions. I use the same single `=`
# for the system packages here for consistency.
sys_progs=(python=3.* conda=4.* git=2.* docker=19.* R=4.* psql=12.* tlmgr=5.* latex=3.* code=1.*)
for sys_prog in ${sys_progs[@]}; do
    sys_prog_no_version=$(sed "s/=.*//" <<< "$sys_prog")
    regex_version=$(sed "s/.*=//" <<< "$sys_prog")
    # Check if the command exists and is is executable
    if [ -x "$(command -v $sys_prog_no_version)" ]; then
        # Check if the version regex string matches the installed version
        if $(grep -iq "$regex_version" <<< "$($sys_prog_no_version --version |  head -1)"); then
            # Since programs like rstudio and vscode don't print the program name with `--version`,
            # we need one extra step before logging
            installed_version=$(grep -io "$regex_version" <<< "$($sys_prog_no_version --version | head -1)")
            echo "OK        "$sys_prog_no_version $installed_version >> check-setup-mds.log
            # Use `head` because `R --version` prints an essay...
            # echo "OK       " $(head -1 <<< "$($sys_prog_no_version --version)") >> check-setup-mds.log
        else  # If the version is wrong
            echo "MISSING   $sys_prog" >> check-setup-mds.log
        fi
    else  # If the executable does not exist
        echo "MISSING   $sys_prog" >> check-setup-mds.log
    fi
done

# 2. Python packages
# Greps the `conda list` output for correct version numbers
# Currently marks both uninstalled and wrong verion number as MISSING
echo "" >> check-setup-mds.log
echo "## Python packages" >> check-setup-mds.log
if ! [ -x "$(command -v conda)" ]; then  # Check that conda exists as an executable program
    echo "Please install 'conda' to check Python package versions." >> check-setup-mds.log
    echo "If 'conda' is installed already, make sure to run 'conda init' if this was not chosen during the installation." >> check-setup-mds.log
    echo "In order to do this after the installation process, first run 'source <path to conda>/bin/activate' and then run 'conda init'." >> check-setup-mds.log
else
    py_pkgs=(jupyterlab=2 numpy=1 pandas=1 flake8=3 black=19 nodejs=10 jupytext=1 jupyterlab-git=0)
    # installed_py_pkgs=$(pip freeze)
    installed_py_pkgs=$(conda list | tail -n +4 | tr -s " " "=" | cut -d "=" -f -2)
    for py_pkg in ${py_pkgs[@]}; do
        # py_pkg=$(sed "s/=/==/" <<< "$py_pkg")
        if $(grep -iq "$py_pkg" <<< $installed_py_pkgs); then
            # Match the package name up until the first whitespace to get regexed versions
            # without getting all following packages contained in the string of all pacakges
            echo "OK        $(grep -io "${py_pkg}\S*" <<< $installed_py_pkgs)" >> check-setup-mds.log
        else
            echo "MISSING   ${py_pkg}.*" >> check-setup-mds.log
        fi
    done
fi

# jupyterlab PDF generation
if ! [ -x "$(command -v jupyter)" ]; then  # Check that jupyter exists as an executable program
    echo "Please install 'jupyterlab' before testing PDF generation." >> check-setup-mds.log
else
    # Create an empty json-compatible notebook file for testing
    echo '{
     "cells": [
      {
       "cell_type": "code",
       "execution_count": null,
       "metadata": {},
       "outputs": [],
       "source": []
      }
     ],
     "metadata": {
      "kernelspec": {
       "display_name": "",
       "name": ""
      },
      "language_info": {
       "name": ""
      }
     },
     "nbformat": 4,
     "nbformat_minor": 4
    }' > mds-nbconvert-pdf-test.ipynb
    if jupyter nbconvert mds-nbconvert-pdf-test.ipynb --to pdf &> /dev/null; then
        echo 'OK        jupyterlab PDF-generation was successful.' >> check-setup-mds.log
    else
        echo 'MISSING   jupyterlab PDF-generation failed. Check that latex and jupyterlab are marked OK above.' >> check-setup-mds.log
    fi
    rm mds-nbconvert-pdf-test.ipynb
fi

# 3. R packages
# Format R package output similar to above for python and grep for correct version numbers
# Currently marks both uninstalled and wrong verion number as MISSING
echo "" >> check-setup-mds.log
echo "## R packages" >> check-setup-mds.log
if ! [ -x "$(command -v R)" ]; then  # Check that R exists as an executable program
    echo "Please install 'R' to check R package versions." >> check-setup-mds.log
else
    r_pkgs=(tidyverse=1 blogdown=0 xaringan=0 renv=0 IRkernel=1 tinytex=0)
    installed_r_pkgs=$(R -q -e "print(format(as.data.frame(installed.packages()[,c('Package', 'Version')]), justify='left'), row.names=FALSE)" | grep -v "^>" | tail -n +2 | sed 's/^ //;s/ *$//' | tr -s ' ' '=')
    for r_pkg in ${r_pkgs[@]}; do
        if $(grep -iq "$r_pkg" <<< $installed_r_pkgs); then
            # Match the package name up until the first whitespace to get regexed versions
            # without getting all following packages contained in the string of all pacakges
            echo "OK        $(grep -io "${r_pkg}\S*" <<< $installed_r_pkgs)" >> check-setup-mds.log
        else
            echo "MISSING   $r_pkg.*" >> check-setup-mds.log
        fi
    done
fi

# rmarkdown PDF generation
if ! [ -x "$(command -v R)" ]; then  # Check that R exists as an executable program
    echo "Please install 'R' before testing PDF generation." >> check-setup-mds.log
else
    # Create an empty Rmd-file for testing
    touch mds-knit-pdf-test.Rmd
    if Rscript -e "rmarkdown::render('mds-knit-pdf-test.Rmd', output_format = 'pdf_document')" &> /dev/null; then
        echo 'OK        rmarkdown PDF-generation was successful.' >> check-setup-mds.log
    else
        echo "MISSING   rmarkdown PDF-generation failed. Check that latex and rmarkdown are marked OK above." >> check-setup-mds.log
    fi
    rm mds-knit-pdf-test.Rmd
fi

# 4. Ouput the saved file to stdout
# I am intentionally using cat in the end instead of `tee` throughout
# so that students have time to read the help message in the beginning.
cat check-setup-mds.log