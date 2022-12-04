range_table <- function (rangable, range_length, summarizable) {
    ranged_table <- data.frame()

    begin_range_point <- 0
    end_range_point <- range_length
    sum <- 0
    j <- 0
    rangable_length <- length(rangable)
    for (i in seq_along(rangable)) {
        item <- rangable[i]

        if (item > end_range_point) {
            new_row <- c(j, begin_range_point, end_range_point, sum)
            ranged_table <- rbind(ranged_table, new_row)

            begin_range_point <- end_range_point
            end_range_point <- end_range_point + range_length

            sum <- 0
            j <- j + 1
        }

        sum <- sum + summarizable[i]

        if (i == rangable_length) {
            new_row <- c(j, begin_range_point, end_range_point, sum)
            ranged_table <- rbind(ranged_table, new_row)
        }
    }

    colnames(ranged_table) <- c("number", "begin", "end", "total")
    return(ranged_table)
}
