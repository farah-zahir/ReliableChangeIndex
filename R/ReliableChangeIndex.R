rm(list = ls())
ls()


#' Reliable Change Index (RCI) value
#'
#' This function calculates Reliable Change Index (RCI) value
#'@param rxy test retest reliability of measure.
#'@param x1 baseline score (pretest).
#'@param x2 retest score.
#'@param s1 baseline standard deviation.
#'@param s2 retest standard deviation.
#'@param PE Control group difference score or the practice effect (Mean score control after – Mean score control before).
#'@return The RCI values based on the input value
#' @export
#' @examples
#' \dontrun{
#' RCI (104,96,13.8,15,0.95,4.3)
#' }
#'

RCI <- function(x1, x2,s1,s2,rxy,PE ) {
  Test <- paste(Test="The Reliable Change Index (RCI)")
  SEdiff <- round(sqrt(((s1^2)+(s2^2))*(1-rxy)),3)
  result <- round(((x2-(x1+PE))/(sqrt(((s1^2)+(s2^2))*(1-rxy)))),3)
  Description <- paste("pretest score=", x1,",", "post-test score=", x2,",","SE diff=",SEdiff,",","practice effect=",PE,",", "The Reliable Change Index (RCI) value=", result)
  Significance <- paste("RCI with a magnitude exceeding 1.96 representing 95% confidence interval is statistically reliable at p<0.05 and RCI exceeding 1.645 is significant at 90% confidence interval")
  return(list(Test=Test,result = result, Description = Description, Significance=Significance))
}
