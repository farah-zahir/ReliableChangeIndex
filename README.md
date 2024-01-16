# Reliable Change Index
## Introduction

This package allows users to calculate Reliable Change Index (RCI), a statistic to determine statistically significant change along with its direction and reliability. This statistic is useful when change is required at individual rather than group level.

In RCTs and observational studies, assessment of the effectiveness of a treatment is done at group level. In such studies, statically significant differences in the primary outcome are sought between two (or more) treatment groups using a hypothesis test with alpha set at less than 5%. Here statistical significance is based on means of both groups. But when the aim is to find significant reliable change at individual level, RCI is the right statistic. Jacobson and Truax (1991) in their paper used this concept as a solution for evaluating change at individual level. Simplistically, RCI is the individual’s score from after the intervention minus their score before the intervention, then divided by the standard error of the difference (SEdiff) of the test. SEdiff can be calculated using tests’ standard deviations and reliability. Although the way different models calculate standard error differ, for this package SEdiff formula is taken from Hinton-Bayre AD & Kwapil KJ (2017).

RCI gives the change in standardized units and increase or decrease is determined by positive or negative signs in the output respectively. Whether it is considered statistically significant (reliable) is dependent on the limit of confidence intervals set (a limit of  95% or 90% confidence can be set). Z-score cut-off of 1.96 corresponds to 95% confidence limits. Any score exceeding these limits is considered statistically significant. It is not uncommon to set the confidence interval of 90% thus the cut-off is relaxed to 1.645 and scores above this are considered significant. 

In addition of calculating reliable change, the bias resulting from improved performance due to repeated exposure known as "Practice Effect" can be corrected by slight amendments in the formula for calculating RCI. Practice effect calculated by taking a difference between baseline and retest control group mean and adding that to baseline scores of individual. So the RCI formula can be written as: 

$[retest score – (baseline score + practice effect)]/SEdiff$

## Installation
To install this package, run the following lines in RStudio:

```r
> install.packages("ReliableChangeIndex")
> remotes::install_github("farah-zahir/ReliableChangeIndex")

```

## Basic Usage
To use the package, run:
```
> library(ReliableChangeIndex)
```

Provide the following for each individual (participant in your data) along with test-retest reliability based on subject matter knowledge (published data) and Control group difference score if applicable:

`x1`: baseline score (pre-test score).
`x2`: retest score.
`s1`: baseline standard deviation.
`s2`: retest standard deviation.
`Rxy`: test retest reliability of measure.
`PE`: Control group difference score or the practice effect (Mean score control after – Mean score control before). If no control group add 0

```r
# compute RCI
Output <- RCI (104,96,13.8,15,0.95,4.3) 
```

Calculated statistic can be printed with:
```r
> Output$result

```
Description of the test significance can be viewed using 
```r
> Output$Significance
```

## Example
### Scenario 1 without Practice Effect adjustment
Using the published example of 75- year- old male with memory loss who has undergone a battery of neuropsychological assessment at initial referral (baseline) and six months after that (retest) (Hinton- Bayre AD & Kwapil KJ, 2017). Let’s say Full Scale IQ at baseline was 104 which reduced to 96 at six-months follow up. The baseline and retest standard deviations were 13.8 and 15 respectively. Test-retest reliability was set at 0.95 based on literature search. The RCI value was calculated as:

```r
> library(ReliableChangeIndex)
> RCI (104,96,13.8,15,0.95,0)

$Test
[1] "The Reliable Change Index (RCI)"

$result
[1] -1.755

$Description
[1] "pretest score= 104 , post-test score= 96 , SE diff= 4.558 , practice effect= 0 , The Reliable Change Index (RCI) value= -1.755"

$Significance
[1] "RCI with a magnitude exceeding 1.96 representing 95% confidence interval is statistically reliable at p<0.05 and RCI exceeding 1.645 is significant at 90% confidence interval"
```

The estimated RCI was -1.75 at a difference of -8 between scores and SEdiff of 4.56. At 95% CI this is not exceeding the Z score of 1.96 so it is statistically not significant but at 90% CI it is exceeding the limit of 1.645 so can be deemed significant.


### Scenario 2 with Practice Effect adjustment
In the above scenario, let us consider that difference between the baseline and retest mean score of the control was 4.3 for Full Scale IQ then RCI will be calculated as:

```r
> library(ReliableChangeIndex)
> RCI (104,96,13.8,15,0.95,4.3)
$Test
[1] "The Reliable Change Index (RCI)"

$result
[1] -2.699

$Description
[1] "pretest score= 104, post-test score= 96 , SE diff= 4.558 , practice effect= 4.3 , The Reliable Change Index (RCI) value= -2.699"

$Significance
[1] "RCI with a magnitude exceeding 1.96 representing 95% confidence interval is statistically reliable at p<0.05 and RCI exceeding 1.645 is significant at 90% confidence interval"
```

The estimated RCI was -2.699 at a difference of -8 between scores and SEdiff of 4.56. This RCI values is statistically significant both at 95% and 90% CI whether we set the cut-off at 1.96 or 1.645 respectively.

# Reference
Hinton-Bayre AD, Kwapil KJ. Best practice approaches for evaluating significant change for individuals. Neuropsychological assessment in the age of evidence-based practice: Diagnostic and treatment evaluations. 2017 Jan 26:120-54 

