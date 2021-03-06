setClass("mzRpwizResource", contains="AnnotationHubResource")
setMethod(".get1", "mzRpwizResource",
    function(x, ...)
{
    .require("mzR")
    yy <- cache(getHub(x))
    mzR::openMSfile(yy, backend = "Ramp")
})

setClass("mzRidentResource", contains="AnnotationHubResource")
setMethod(".get1", "mzRidentResource",
    function(x, ...) 
{
    .require("mzR")
    yy <- cache(getHub(x))
    mzR::openIDfile(yy)
})

setClass("MSnSetResource", contains="RdaResource")
setMethod(".get1", "MSnSetResource",
    function(x, ...) 
{
    .require("MSnbase")
    callNextMethod(x, ...) 
})

setClass("AAStringSetResource", contains="AnnotationHubResource")
setMethod(".get1", "AAStringSetResource",
     function(x, ...) 
{
    .require("Biostrings")
    yy <- cache(getHub(x))
    Biostrings::readAAStringSet(yy)
})
