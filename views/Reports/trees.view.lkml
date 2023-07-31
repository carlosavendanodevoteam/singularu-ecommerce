# The name of this view in Looker is "Trees"
view: trees {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Reports.Trees` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: care_taker {
    type: string
    sql: ${TABLE}.care_taker ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: plant_month {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.plant_month ;;
  }

  dimension: site_info {
    type: string
    sql: ${TABLE}.site_info ;;
  }

  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: total_trees {
    type: number
    sql: ${TABLE}.total_trees ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_trees {
    type: sum
    sql: ${total_trees} ;;  }
  measure: average_total_trees {
    type: average
    sql: ${total_trees} ;;  }
  measure: count {
    type: count
  }
}
