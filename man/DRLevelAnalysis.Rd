% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DRAP_code_1.5.10.r
\name{DRLevelAnalysis}
\alias{DRLevelAnalysis}
\title{Caculate response evaluation indexes}
\usage{
DRLevelAnalysis(data, by, measurement = c('RR','DCR','both'))
}
\arguments{
\item{data}{drug response level ,the output of DRLevel.}

\item{by}{the level summaried by.}

\item{measurement}{the measurement of drug response criteria calcuated, whether "RR", "DCR", or "both".}
}
\description{
Caculate response evaluation indexes, such as RR and DCR, based on drug response level.
}
\details{
RR (response rate) is the percentage of animals that response level is better than partial repsone (PR) after treatment. DCR (decease control rate) is the percentage of animals that response level is better than stable disease (SD) after treatment.
}
\examples{
# NPDXE.criteria 
npdxe.criteria <- data.frame(BestResponse.lower = c(-1000,-0.95,-0.5,0.35),
                             BestResponse.upper = c(-0.95,-0.5,0.35,1000),
                             BestAvgResponse.lower = c(-1000,-0.4,-0.2,0.3), 
                             BestAvgResponse.upper = c(-0.4,-0.2,0.3,1000), 
                             Level = c( 'CR','PR', 'SD','PD'))
npdxe.criteria

### oneAN pattern
data(oneAN.volume.data)
oneAN.drl <- DRLevel(data = oneAN.volume.data, method = 'NPDXE.Response', 
                     criteria = npdxe.criteria, neg.control = 'Control')
DRLevelAnalysis(oneAN.drl,by = 'Arms', measurement = 'both')

\donttest{
### TAN pattern
data(TAN.volume.data)
TAN.drl <- DRLevel(data = TAN.volume.data, method = 'NPDXE.Response', 
                   criteria = npdxe.criteria, neg.control = 'Control')
DRLevelAnalysis(TAN.drl,by='Arms',measurement = 'both')
DRLevelAnalysis(TAN.drl,by=c('Arms','Tumor'),measurement = 'both')

### TAone pattern
data(TAone.volume.data)
TAone.drl <- DRLevel(data = TAone.volume.data, method = 'NPDXE.Response', 
                     criteria = npdxe.criteria, neg.control = 'Control')
head(TAone.drl)
TAone.drl.analysis = DRLevelAnalysis(data = TAone.drl,by = c('Arms','Type'),measurement = 'both')
head(TAone.drl.analysis)
}

}
