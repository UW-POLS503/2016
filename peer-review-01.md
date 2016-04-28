# Peer Review Assignment

Review the paper (theory, data, and model parts) of the peer to which you have been assigned. You should access the author's write-up, code, and data by going to his/her repository. 
The objective of this assignment is to give constructive feedback in order to help the author improve their paper.[^1]
The following sections provide some general suggestions of things to look for.
However, you are not a coauthor of the paper, nor should you be asking the author to write the paper you would have written.
Take the question that the author is asking as given, and address whether they adequately answer it.
You are also not acting as a gatekeeper for the discipline: you do not need to address whether the question and analysis is innovative, novel, or contributing to a literature.[^2]

You are asked to check whether the analysis is replicable: Does the code run and produce the results reported in the paper?
If you are having problems with the code, contact the author to resolve them by opening an issue in the author's project repository; cc the instructors (`cc @jrnold @CasAndreu`).

Your need to submit your peer review assignment as a new issue in the author's project repository; cc the instructors and the author. Your peer review should follow this format:

- Start by summarizing the paper. What is the question? What are the data and methods used to address the question?
- Discuss general comments.
- Discuss specific comments (perhaps in a bullet list). These would include things like a confusing graph, or an unclear sentence on a specific page.

[^1]: This is different than reviewing an article, in which the objective is to determine whether the paper is publishable or not. This is an example of pre-publication comments when you offer advice to an author.
[^2]: Though if you find it is, point it out.

## Questions to consider

These are some questions to guide your review, but should not be considered an exclusive list.

### Research question and hypothesis:

- Is the researcher focused on well‐defined questions?
- Is the author attempting to identify a causal impact or is it descriptive or inductive?
- Could there be alternative models that produce similar predictions—that is, does evidence on the
predictions necessarily weigh on the model or explanation?
- Is the theory a theory, or a list of predictions?

### Data:

- Are the data clearly described? If you were to replicate the paper, would you know where to get the data from (sources) and how to process it in order to produce the dataset the author is using?
- Is the choice of data well‐suited to the question?
- Are there any worrying sources of measurement error or missing data?
- Are there sample size or power issues?
- Could the data sources or collection method be biased?
- Are there types of data that should have been reported, or would have been useful or essential in the
empirical analysis?

### Empirical analysis:

- What are the response and outcome variables?
- Are the statistical techniques suggested well suited to the problem at hand?
- Can you imagine a better, or alternative, empirical strategy?
- Is the empirical strategy convincing? Are appropriate caveats mentioned?

## Replication

- Did they cite the sources of the data? They should provide enough information so that you can find the original data that they used; verify that by trying to find the data.
- Was the code and data in the authors' repository? Were you able to run the code?
- Did the code produce the results that were given in the paper?
- Was the code understandable and well-commented?
  Could you easily tell which parts of the code produced which tables, figures, and results?


## General Advice

How to do peer review well (https://stat545-ubc.github.io/peer-review02_peer-evaluation-guidelines.html)

- Give thoughtful, constructive and considerate comments.
- Be specific and concise.
- Try to learn something new and, if you succeed, point that out.
- If you can’t find anything to praise or that you found helpful, then at least offer some suggestions in a kind way.

## Evaluations of Peer Review

Peer reviews will be evaluated as "good" or "needs more".
Some reasons why a peer review will be given a grade of "needs more":

- The review is so generic that it’s hard to determine which assignment you’re reviewing.
- The review is mean.
- The review neither expresses good points nor offers suggestions.

## References

There are some good sources and suggestions on "doing" peer review.
These are geared to reviewing manuscripts for publication, which has a different objectives than this assignment.
However, these are useful to read for your professional development.

- *The Political Methodologist*, Fall 2015, issue on Peer Review [[URL]](https://thepoliticalmethodologist.files.wordpress.com/2016/02/tpm_v23_n1.pdf), especially Brendan Nyhan, "A Checklist Manifesto for Peer Review" and Thomas Pepinsky, "What is Peer Review For? Why Referees are not the Disciplinary Police".
- Miller, Beth, Jon Pevehouse, Ron Rogowski, Dustin Tingley, and Rick Wilson. 2013. “How To Be a Peer Reviewer: A Guide for Recent and Soon-to-be PhDs.” *PS: Political Science & Politics* [[DOI]](https://dx.doi.org/10.1017/S104909651200128X)
- Chris Blattman [Research Design & Casual Inference Syllabus](http://chrisblattman.com/files/2009/07/PLSC508-Syllabus-Spring2010.pdf), last two pages
- Tyler Cowen [How to be a good referee](http://marginalrevolution.com/marginalrevolution/2006/10/how_to_be_a_goo.html)
- William Thompson, *A Guide for the Young Economist*, 2nd ed. Ch 4 "Writing Referee Reports".


* * *

Derived in part from Jenny Bryan [Guidelines for peer review of assignments](https://stat545-ubc.github.io/faq.html) [CC BY-NC 3.0 Create Commons License](http://creativecommons.org/licenses/by-nc/3.0/)

Several of these questions come from the syllabus of Chris Blattman for [Research Design and Causal Inference](http://chrisblattman.com/files/2009/07/PLSC508-Syllabus-Spring2010.pdf).
