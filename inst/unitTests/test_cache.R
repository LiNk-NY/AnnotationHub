test_cache_datapathIds <- function() {
    ## map hub identifiers AH123 to cached identifier(s)
    hub <- AnnotationHub()

    ## 1:1 mapping
    result <- AnnotationHub:::.datapathIds(hub["AH28854"])
    checkIdentical(result, structure(34294L, .Names = "AH28854"))

    ## 1:several mapping
    result <- AnnotationHub:::.datapathIds(hub["AH169"])
    checkIdentical(result,
                   structure(c(169L, 14130L), .Names = c("AH169", "AH169")))

    ## unknown identifier
    result <- AnnotationHub:::.datapathIds(hub["AH0"])
    checkIdentical(result, setNames(integer(), character()))
}

test_max_download <- function() {
    FUN <- AnnotationHub:::.cache_download_ok

    checkIdentical(rep(TRUE, 0), FUN(rep(tempfile(), 0), 4))
    checkIdentical(rep(TRUE, 3), FUN(rep(tempfile(), 3), 4))
    checkIdentical(rep(TRUE, 3), FUN(rep(tempfile(), 3), 3))

    file.create(fl <- tempfile())
    checkIdentical(c(TRUE, FALSE), FUN(c(tempfile(), fl), 2))
    checkIdentical(c(TRUE, FALSE, TRUE), FUN(c(tempfile(), fl, tempfile()), 2))

    if (!interactive()) {
        checkException(FUN(rep(tempfile(), 3), 2))
        checkException(FUN(c(tempfile(), fl, tempfile(), tempfile()), 2))
    }
}
