sort_table <- function (table, sorted_by) {
    value <- table[order(sorted_by),]
    return(value)
}

range_table <- function (rangable, group_width, summarizable) {
    ranged_table <- data.frame()

    begin_range_point <- 0
    end_range_point <- group_width
    sum <- 0
    j <- 0
    rangable_length <- length(rangable)
    for (i in seq_along(rangable)) {
        item <- rangable[i]

        if (item > end_range_point) {
            new_row <- c(j, begin_range_point, end_range_point, sum)
            ranged_table <- rbind(ranged_table, new_row)

            begin_range_point <- end_range_point
            end_range_point <- end_range_point + group_width

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

frequent_table <- function (rangable, group_width) {
    ranged_table <- data.frame()

    begin_range_point <- 0
    end_range_point <- group_width
    observation_frequency <- 0
    observations <- 0
    j <- 0
    rangable_length <- length(rangable)
    for (i in seq_along(rangable)) {
        item <- rangable[i]

        if (item > end_range_point) {
            new_row <- c(j, begin_range_point, end_range_point, observation_frequency, observations)
            ranged_table <- rbind(ranged_table, new_row)

            begin_range_point <- end_range_point
            end_range_point <- end_range_point + group_width

            observation_frequency <- 0
            j <- j + 1
        }

        observation_frequency <- observation_frequency + 1
        observations <- observations + 1

        if (i == rangable_length) {
            new_row <- c(j, begin_range_point, end_range_point, observation_frequency, observations)
            ranged_table <- rbind(ranged_table, new_row)
        }
    }

    colnames(ranged_table) <- c("number", "begin", "end", "observation_frequency",  "observation_frequency")
    return(ranged_table)
}
