# The name of this view in Looker is "Partitioned Clustered Table"
view: partitioned_clustered_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wiki_pc_demo.partitioned_clustered_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: datehour {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.datehour ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Title" in Explore.

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_views {
    type: sum
    sql: ${views} ;;  }
  measure: average_views {
    type: average
    sql: ${views} ;;  }

  dimension: wiki {
    type: string
    sql: ${TABLE}.wiki ;;
  }
  measure: count {
    type: count
  }
}
