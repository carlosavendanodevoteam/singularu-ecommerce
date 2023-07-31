# The name of this view in Looker is "Days with Rain"
view: days_with_rain {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ecommerce.days_with_rain` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Prcp" in Explore.

  dimension: prcp {
    type: number
    sql: ${TABLE}.prcp ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_prcp {
    type: sum
    sql: ${prcp} ;;  }
  measure: average_prcp {
    type: average
    sql: ${prcp} ;;  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.station_name ;;
  }
  measure: count {
    type: count
    drill_fields: [station_name]
  }
}
