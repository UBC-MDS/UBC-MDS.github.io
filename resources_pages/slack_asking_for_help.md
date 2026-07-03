---
layout: page
title: Using Slack and asking for help
---


#### Asking about the course content

One reason we use Slack is so that you can ask for help. If you have a general question that is not about your specific situation or work, **we strongly encourage you to post it in a course channel or the #general channel.** If you message us privately we may ask you to re-post in a channel.
The reason for this is that often many students have the same question and it is much more efficient to have them answered in a public forum. Beyond that, it's often comforting for students to see other students asking questions,
and generally encourages a vibrant Slack ecosystem.

#### Asking a logistics question

If you have a logistics question, first check the FAQ section in the Slack Course Coordinator Bot. You can open the bot by typing /cc in any channel and pressing Enter. If your question is not answered there, contact the course coordinators using the bot.

#### Asking about your marks

If you have a question about how your lab or quiz was marked, please submit a regrade request in GradeScope or [an error report in PrairieLearn](https://ubc-mds.github.io/resources_pages/quiz/#quiz-results-review-session).

#### How to ask

We illustrate best practices via two examples.


##### Example of a problematic post

> @instructor For question 1(b) I get an error when I run the code, should I try removing missing data? Error: computer$ python test.py
Traceback (most recent call last):
  File "test.py", line 1, in <module>
    hello, world
NameError: name 'hello' is not defined

This post is problematic for the following reasons:

- It tags the instructor. This tends to discourage others (TAs or students) from responding, which increases response time and instructor workload.
- It does not provide context, or indicate which lab or worksheet the question is about.
- It asks whether something should be tried, even though the student could have tried this before asking.
- The code and error message are not formatted properly with `code font`.

&nbsp;

##### Example of a good post

> **Lab 2 question 1(b)** I get the following error when I run the code with `python test.py`:
```
computer$ python test.py
Traceback (most recent call last):
  File "test.py", line 1, in <module>
    hello, world
NameError: name 'hello' is not defined
```
> I tried the approach suggested by @otherstudent above, and I also tried removing missing data but the problem wasn't solved. Any help appreciated.

This post is well-crafted for the following reasons:

- a link to the lab is provided. Note that if the lab is an `.md` or `.Rmd` file then you can link to the actual question itself, but if it's a `.pdf` or other formats then you can only link to the top of the document.
- The post begins with the lab question in doubt in bold, which is clear and helps other students with similar questions locate the thread.
- The actual command used to run the code (`python test.py`) is specified.
- The specific error message is provided and formatted properly.
- The student read the preceding conversation and made a reasonable effort to solve the problem but still encountered difficulties.

#### Where to ask

Slack is intended for ephemeral content. If your assignment-related question is complicated and cannot be answered in just a few thread replies, ask your question in one of the office hours instead. If you have a question/post/comment that may be useful in the long-term, please open an Issue in the students repo of the relevant course on GitHub. 

Examples of content that are better posted on Slack include:

- a conceptual question about something covered in lecture/lab.
- asking for help with a bug in your code.

Examples of content that is better posted on GitHub include:

- useful resources/readings that the instructor may want to add to the course README for future years.
- hints/workarounds/fixes for the labs that the instructor may want to incorporate into the lab for current/future years.


#### Multi-post questions/comments

Keep in mind that when you post in Slack, people may get notifications. Therefore, it is often best to write out your whole message before posting. For example, if you write

> Hi there

(10 seconds later)

> I have a question about DSCI 551

(10 seconds later)

> Your question here

Then other users will receive a notification at the start, which will potentially pull their attention to Slack before there is anything meaningful to read. Thus, it is more efficient if there is enough content for someone to read and digest before posting the first time. This applies both to direct messages and channel posts.

#### Professionalism

MDS takes pride in creating a close and inclusive environment in our teaching and learning spaces including our Slack community. We encourage participation in all private, public and direct messaging channels, however, we ask that you follow the [Code of Conduct](https://ubc-mds.github.io/resources_pages/code_of_conduct/) while doing so.

Although Slack is a great tool and is constantly available, we expect you to maintain a respectful and professional relationship with your peers and the academic team. Generally, instructors and TAs will attempt to respond to your questions in a timely manner, but it's important to understand they do have other responsibilities outside of the program. An example of unprofessional Slack usage is messaging an instructor late at night and asking for or expecting an immediate response.
